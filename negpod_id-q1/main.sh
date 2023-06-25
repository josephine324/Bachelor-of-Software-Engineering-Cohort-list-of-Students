#!/usr/bin/env bash

while true; do
    echo "========================"
    echo "Bachelor of Software Engineering Cohort List"
    echo "========================"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    echo "========================"
    echo -n "Enter your choice (1-5): "
    read choice

    case $choice in
        1) # Create student record
            echo "Enter student email: "
            read email
            echo "Enter student age: "
            read age
            echo "Enter student ID: "
            read id

            echo "$email,$age,$id" >> students-list_0333.txt
            echo "Student record created successfully!"
            ;;
        2) # View all students
            echo "========================"
            echo "Student List"
            echo "========================"
            cat students-list_0333.txt
            ;;
        3) # Delete student record
            echo -n "Enter student ID to delete: "
            read delete_id
            sed -i "/$delete_id/d" students-list_0333.txt
            echo "Student record deleted successfully!"
            ;;
        4) # Update student record
            echo -n "Enter student ID to update: "
            read update_id
            echo -n "Enter updated email: "
            read updated_email
            echo -n "Enter updated age: "
            read updated_age

            sed -i "s/$update_id.*,/$updated_email,$updated_age,$update_id/" students-list_0333.txt
            echo "Student record updated successfully!"
            ;;
        5) # Exit the application
            echo "Exiting the application..."
            exit 0
            ;;
        *) # Invalid choice
            echo "Invalid choice. Please enter a number between 1 and 5."
            ;;
    esac
done

