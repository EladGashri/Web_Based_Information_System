from flask import Blueprint, render_template, request, url_for, session
from utilities.db.db_manager import dbManager

# dba blueprint definition
dba = Blueprint('dba', __name__, static_folder='static', static_url_path='/dba', template_folder='templates')


# Routes
@dba.route('/dba', methods=['GET', 'POST'])
def index():
    global message
    global table_columns

    if request.method=='GET':

        if request.args.get('table'):
            message = ''
            table_name = request.args['table']
        else:
            tables_names=dbManager.fetch('select TABLE_NAME from information_schema.tables WHERE table_schema =%s', ('group2',))
            return render_template('dba.html', tables_names=tables_names, table=False)


    elif request.method=='POST':

        if request.form.get('drop'):
            drop_query=dbManager.commit('DROP TABLE ' + request.form['drop'])
            if drop_query==-1:
                message='Query failed. Table not dropped'
            else:
                message='Table dropped.'
            tables_names = dbManager.fetch('select TABLE_NAME from information_schema.tables WHERE table_schema =%s', ('group2',))
            return render_template('dba.html', tables_names=tables_names, message=message, table=False)

        elif request.form.get('create'):
            columns_indexes=[]
            for i in range(1,8):
                if request.form[str(i)+'column']:
                    columns_indexes.append(i)
            create=''
            for i in range(len(columns_indexes)):
                index=str(columns_indexes[i])
                if request.form[index+'column']:
                    create = create + request.form[index + 'column'] + ' '
                    create = create + request.form[index + 'type'] + ' '
                    if index in request.form.getlist('not_null'):
                        create = create + 'NOT NULL '
                    if index in request.form.getlist('unique'):
                        create = create + 'UNIQUE '
                    create = create + ', '
            p_keys_indexes=request.form.getlist('p_key')
            p_keys=''
            if len(p_keys_indexes) > 0:
                p_keys=' PRIMARY KEY ('
                for i in range(len(p_keys_indexes)):
                    p_keys = p_keys + request.form[str(p_keys_indexes[i]) + 'column'] + ' '
                    if i ==len(p_keys_indexes)-1 :
                        p_keys = p_keys + '), '
                    else:
                        p_keys = p_keys + ', '
            f_keys_indexes = request.form.getlist('f_key')
            f_keys=''
            if len(f_keys_indexes) > 0:
                for i in f_keys_indexes:
                    f_keys = f_keys + 'FOREIGN KEY (' + request.form[str(i) + 'column'] + ') ' + 'REFERENCES ' + \
                             request.form[str(i) + 'f_table'] + ' (' + request.form[str(i) + 'f_column'] + '), '
            full_create = create + p_keys + f_keys
            Full_create = full_create[:-2]
            create_query = dbManager.commit('CREATE TABLE IF NOT EXISTS ' + request.form['create'] + ' ( ' + Full_create + ')')
            if create_query==-1:
                message='Query failed due to invalid values entered. New table not created.'
            else:
                message = 'New table created.'
            tables_names = dbManager.fetch('select TABLE_NAME from information_schema.tables WHERE table_schema =%s', ('group2',))
            return render_template('dba.html', tables_names=tables_names, message=message, table=False)

        table_name = request.args['table']
        if request.form.get('delete'):
            indexes = request.form.getlist('delete')
            for i in range(len(indexes)):
                primary=dbManager.fetch('SELECT COLUMN_NAME FROM information_schema.columns WHERE table_schema =%s AND'
                                        ' table_name=%s AND column_key=%s',('group2', table_name, 'PRI'))
                offset=str(eval(indexes[i] + ' -' + str(i+1) ))
                row=dbManager.fetch('SELECT * FROM ' + table_name + ' LIMIT 1 OFFSET ' + offset)
                primary_keys=''
                values_list = []
                for i in range(len(primary)):
                    primary_keys = primary_keys + primary[i].COLUMN_NAME + '=%s '
                    values_list.append(getattr(row[0],primary[i].COLUMN_NAME))
                    if i!=len(primary)-1:
                        primary_keys = primary_keys + 'AND '
                values=tuple(values_list)
                delete_query = dbManager.commit('DELETE FROM '+ table_name +' WHERE ' + primary_keys,(values))
                if delete_query == -1:
                    message = 'Query failed. Rows not deleted.'
                else:
                    message='Rows deleted.'

        elif request.form.get('update'):
            table_columns = dbManager.fetch('SELECT COLUMN_NAME FROM information_schema.columns WHERE table_schema =%s AND'
                                            ' table_name=%s ',('group2', table_name))
            index=request.form['update']
            offset = str(eval(index + ' -1'))
            primary = dbManager.fetch('SELECT COLUMN_NAME FROM information_schema.columns WHERE table_schema =%s AND'
                                      ' table_name=%s AND column_key=%s',('group2', table_name, 'PRI'))
            row = dbManager.fetch('SELECT * FROM ' + table_name + ' LIMIT 1 OFFSET ' + offset)
            primary_keys = ''
            values_list1 = []
            for i in range(len(primary)):
                primary_keys = primary_keys + primary[i].COLUMN_NAME + '=%s '
                values_list1.append(getattr(row[0], primary[i].COLUMN_NAME))
                if i != len(primary) - 1:
                    primary_keys = primary_keys + 'AND '
            values1 = tuple(values_list1)
            columns_indexes=[]
            for i in range(len(table_columns)):
                column = table_columns[i].COLUMN_NAME
                if request.form.get(column):
                    columns_indexes.append(i)
            set=''
            values_list2=[]
            for i in range(len(columns_indexes)):
                column = table_columns[columns_indexes[i]].COLUMN_NAME
                set = set + column + '=%s'
                values_list2.append(request.form[column])
                if i==len(columns_indexes)-1:
                    set = set + ' '
                else:
                    set=set + ', '
            values2 = tuple(values_list2)
            all_values = values2 + values1
            update_query=dbManager.commit('UPDATE ' + table_name + ' SET ' + set + ' WHERE ' + primary_keys, (all_values))
            q = 'UPDATE ' + table_name + ' SET ' + set + ' WHERE ' + primary_keys + 'VALLUES:' + str(all_values)
            if update_query==-1:
                message='Query failed due to invalid values entered. Row not updated.'
            else:
                message='Row updated.'

        else:
            table_columns = dbManager.fetch('SELECT COLUMN_NAME FROM information_schema.columns WHERE table_schema =%s AND'
                ' table_name=%s ', ('group2', table_name))
            insert = ' ('
            values_list_insert = []
            for i in range(len(table_columns)):
                column = table_columns[i].COLUMN_NAME
                if request.form.get(column):
                    insert = insert + ' %s'
                    values_list_insert.append(request.form[column])
                else:
                    insert = insert +'NULL'
                if i == len(table_columns) - 1:
                    insert = insert + ') '
                else:
                    insert = insert + ', '
            values_insert=tuple(values_list_insert)
            insert_query = dbManager.commit('INSERT INTO ' + table_name + ' VALUES ' + insert,values_insert)
            if insert_query==-1:
                message='Query failed due to invalid values entered. New row not inserted.'
            else:
                message='New row inserted.'


    table_data = dbManager.fetch('SELECT * FROM ' + table_name)
    table_columns = dbManager.fetch('SELECT COLUMN_NAME FROM information_schema.columns WHERE table_schema =%s AND '
                                    'table_name=%s ',('group2', table_name))
    columns_types = dbManager.fetch('SELECT DATA_TYPE FROM information_schema.columns WHERE table_schema =%s AND '
                                    'table_name=%s ',('group2', table_name))
    nullable=dbManager.fetch('SELECT IS_NULLABLE FROM information_schema.columns WHERE table_schema = %s AND '
                             'table_name=%s',('group2', table_name))
    return render_template('dba.html', table=True, table_name=table_name, table_data=table_data,table_columns=table_columns,
                           columns_types=columns_types, nullable=nullable, message=message)