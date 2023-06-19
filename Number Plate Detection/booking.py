import sqlite3

conn = sqlite3.connect('smart_parking.db')
cur = conn.cursor()
def book_slot(slot_type, user_id, start_time, end_time):
    cur.execute("INSERT INTO bookings (slot_type, user_id, start_time, end_time) VALUES (?, ?, ?, ?)", (slot_type, user_id, start_time, end_time))
    conn.commit()
    return "Slot booked successfully."

def leave_slot(slot_id):
    cur.execute("DELETE FROM bookings WHERE id=?", (slot_id,))
    conn.commit()
    return "Slot left successfully."

def confirm_slot(slot_id):
    cur.execute("UPDATE bookings SET confirmed=1 WHERE id=?", (slot_id,))
    conn.commit()
    return "Slot confirmed successfully."

def assign_slot(slot_type, user_id):
    cur.execute("SELECT id FROM slots WHERE type=? AND id NOT IN (SELECT slot_id FROM bookings WHERE confirmed=1 AND end_time > datetime('now')) LIMIT 1", (slot_type,))
    row = cur.fetchone()
    if row:
        slot_id = row[0]
        cur.execute("INSERT INTO bookings (slot_id, user_id) VALUES (?, ?)", (slot_id, user_id))
        conn.commit()
        return f"Slot {slot_id} assigned to user {user_id} successfully."
    else:
        return f"No available {slot_type} slot found."
def main():
    while True:
        print("Welcome to the Smart Parking app!")
        print("1. Book a slot")
        print("2. Leave a slot")
        print("3. Confirm parking")
        print("4. Assign a parking slot")
        print("0. Exit")
        choice = input("Enter your choice: ")

        if choice == "1":
            slot_type = input("Enter slot type (student/faculty/guest): ")
            user_id = input("Enter user ID: ")
            start_time = input("Enter start time (HH:MM): ")
            end_time = input("Enter end time (HH:MM): ")
            print(book_slot(slot_type, user_id, start_time, end_time))

        elif choice == "2":
            slot_id = input("Enter slot ID: ")
            print(leave_slot(slot_id))

        elif choice == "3":
            slot_id = input("Enter slot ID: ")
            print(confirm_slot(slot_id))

        elif choice == "4":
            slot_type = input("Enter slot type (student/faculty/guest): ")
            user_id = input("Enter user ID: ")
            print(assign_slot(slot_type, user_id))

        elif choice == "0":
            print("Thank you for using the Smart Parking app!")
            break

        else:
            print("Invalid choice. Please try again.")
           #edited ;;;;
main()
