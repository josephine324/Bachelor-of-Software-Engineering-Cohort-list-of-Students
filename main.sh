#!/usr/bin/env bash
#building an application
students_file="students-list_0333.txt"

create_student() {
    read -p "Enter student email: " email
    read -p "Enter student age: " age
    read -p "Enter student ID: " student_id

    echo "$email $age $student_id" >> "$students_file"
    echo "Student record created."
}

view_students() {
	if [ -s "$students_file" ]; then
		cat $students_file
	else
		echo "No students found."
	fi
}

delete_student() {
    read -p "Enter student ID to delete: " student_id
    if grep -q "^.* $student_id\$" "$students_file"; then
        sed -i "/^.* $student_id\$/d" "$students_file"
        echo "Student deleted."
    else
        echo "Student not found."
    fi
}
update_student() {
    read -p "Enter student ID to update: " student_id
    if grep -q "^.* $student_id\$" "$students_file"; then
        read -p "Enter updated email: " email
        read -p "Enter updated age: " age

        sed -i "/^.* $student_id\$/d" "$students_file"
        echo "$email $age $student_id" >> "$students_file"
        echo "Student updated."
    else
        echo "Student not found."
    fi
}

while true
do
    echo "----- Bachelor of Software Engineering Cohort List -----"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student"
    echo "4. Update student record"
    echo "5. Exit"

    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)
            create_student
            ;;
        2)
            view_students
            ;;
        3)
            delete_student
            ;;
        4)
            update_student
            ;;
        5)
            echo "Exiting the application."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter a number from 1 to 5."
            ;;
    esac

    echo "-----------------------------------------------------"
done
