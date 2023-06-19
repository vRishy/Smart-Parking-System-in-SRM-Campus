import sqlite3
conn = sqlite3.connect('smart_parking.db')
cur = conn.cursor()
x = conn.execute('''select * from bookings ''')
for i in x:
    print(i[0],i[1],i[2],i[3])
conn.commit()