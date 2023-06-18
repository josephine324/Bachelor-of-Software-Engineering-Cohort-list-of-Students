#!/usr/bin/env bash
#Take information from users and buid the Bachelor of Software enggineering
#!/usr/bin/env bash
#Takes information from users and build the Bachelor of Software engineering cohort list
students_file="students-list_0333.txt"
emails_file="student-emails.txt"

while true; do
    echo "----------------------------"
    echo "Bachelor of Software Engineering Cohort List"
    echo "----------------------------"
    echo "1. Create a student record"
    echo "2. View all students"
    echo "3. Delete a student"
    echo "4. Update a student record"
    echo "5. Select emails"
    echo "6. Exit"
    echo "----------------------------"

    read -p "Enter your choice: " choice
    echo "----------------------------"

    case $choice in
        1)
            read -p "Enter student email: " email
            read -p "Enter student age: " age
            read -p "Enter student ID: " student_id
            echo "$email, $age, $student_id" | tee -a "$students_file" >/dev/null
            echo "Student record created successfully."
            ;;
        2)
            echo "List of all students:"
            cat "$students_file"
            ;;
        3)
            read -p "Enter student ID to delete: " delete_id
            if grep -q "^$delete_id," "$students_file"; then
                sed -i "/^$delete_id,/d" "$students_file"
                echo "Student record deleted successfully."
            else
                echo "Student ID not found."
            fi
            ;;
        4)
            read -p "Enter student ID to update: " update_id
            if grep -q "^$update_id," "$students_file"; then
                read -p "Enter new student email: " new_email
                read -p "Enter new student age: " new_age
sed -i "s/^$update_id,.*/$new_email, $new_age, $update_id/g" "$students_file"
                echo "Student record updated successfully."
            else
                echo "Student ID not found."
            fi
            ;;
        5)
            grep -oE '[[:alnum:]_.+-]+@[[:alnum:]_-]+\.[[:alnum:]_-]+' "$students_file" > "$emails_file"
            echo "Selected emails saved to $emails_file."
            ;;
        6)
            echo "Exiting the application."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    echo "----------------------------"
done
