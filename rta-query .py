import mysql.connector

cnx = mysql.connector.connect(user='root', password='' #enter your sql password, 
                              host='127.0.0.1',
                              database='rta')

cursor = cnx.cursor()

area = input('Enter the area you currently live in: ')

query = f"SELECT route_name, terminal_name FROM terminal AS t, route AS r WHERE r.route_id = t.route_id AND r.route_name LIKE '%{area}%';"
cursor.execute(query)

flag = False

for (route_name, terminal_name) in cursor:
    flag = True
    print(route_name, terminal_name)

if flag == False:
    print("There are no routes for your area.")

cursor.close()
cnx.close()