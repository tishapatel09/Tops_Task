import json
import os
import requests

API_URL = "https://jsonplaceholder.typicode.com/posts?_limit=10"
COMMISSION_RATE = 0.10

class Order:
    def __init__(self, id, name, amount, status):
        self.id = id
        self.name = name
        self.amount = amount
        self.status = status

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "amount": self.amount,
            "status": self.status
        }


def fetch_restaurants():
    try:
        response = requests.get(API_URL)

        if response.status_code == 200:
            data = response.json()

            restaurants = []

            for record in data:
                restaurant = Order(
                    record["id"],
                    record["title"],
                    0,
                    True
                )
                restaurants.append(restaurant)

            print("\nTop 10 Restaurants:")
            for restaurant in restaurants:
                print(
                    f"ID: {restaurant.id} | "
                    f"Name: {restaurant.name}"
                )

            return restaurants

        else:
            print(f"API Error: HTTP {response.status_code}")
            print("Could not fetch restaurant data.")
            return []

    except requests.RequestException as error:
        print(f"API request failed: {error}")
        return []

def add_restaurant():
    print("\n--- Add New Restaurant ---")

    while True:
        try:
            restaurant_id = int(input("Enter restaurant ID: "))
            break
        except ValueError:
            print("Error: ID must be a numeric value. Please try again.")

    name = input("Enter restaurant name: ")

    while True:
        try:
            amount = float(input("Enter order amount: "))
            break
        except ValueError:
            print("Error: Amount must be a numeric value. Please try again.")

    status = input("Enter status (active/inactive): ").strip().lower()

    while status not in ["active", "inactive"]:
        print("Error: Status must be 'active' or 'inactive'.")
        status = input("Enter status (active/inactive): ").strip().lower()

    restaurant = Order(
        restaurant_id,
        name,
        amount,
        status == "active"
    )

    print("\nRestaurant added successfully!")
    print(restaurant.to_dict())

    return restaurant

def calculate_commission(records):
    active_records = filter(
        lambda record: record.status,
        records
    )

    commissions = map(
        lambda record: (record.name, record.amount * COMMISSION_RATE),
        active_records
    )

    commissions = list(commissions)

    print("\n--- Commission Details ---")

    if not commissions:
        print("No active records available.")
        return

    for name, commission in commissions:
        print(f"{name}: ₹{commission:.2f}")



def save_and_load_records(records):
    file_path = "data/processed/records.json"

    os.makedirs("data/processed", exist_ok=True)

    data = [record.to_dict() for record in records]

    with open(file_path, "w", encoding="utf-8") as file:
        json.dump(data, file, indent=4)

    print("\nRecords saved successfully!")

    loaded_records = []

    with open(file_path, "r", encoding="utf-8") as file:
        saved_data = json.load(file)

    for record in saved_data:
        loaded_record = Order(
            record["id"],
            record["name"],
            record["amount"],
            record["status"]
        )
        loaded_records.append(loaded_record)

    print(f"Records loaded successfully: {len(loaded_records)}")

    return loaded_records

def main():
    records = []

    while True:
        print("\n========== FOOD DELIVERY LIVE DATA PIPELINE ==========")
        print("1. Fetch and display top 10 restaurants")
        print("2. Add a new restaurant")
        print("3. Calculate commission")
        print("4. Save and load records")
        print("5. Exit")

        choice = input("Enter your choice: ").strip()

        if choice == "1":
            fetched_records = fetch_restaurants()
            records.extend(fetched_records)

        elif choice == "2":
            restaurant = add_restaurant()
            records.append(restaurant)

        elif choice == "3":
            calculate_commission(records)

        elif choice == "4":
            records = save_and_load_records(records)

        elif choice == "5":
            print("\nThank you for using the Food Delivery Pipeline!")
            break

        else:
            print("\nInvalid choice. Please enter a number from 1 to 5.")


if __name__ == "__main__":
    main()          