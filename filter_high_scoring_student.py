# Write a Python function to return a list of names of students who scored more than 87.

def filter_high_scoring_student(response):
    student_list = []

    for student in response["data"]:
        if student["score"] > 87:
            student_list.append(student["name"])
        else:
            continue

    return list(student_list)

response = {
    "data":[
        {"id": 1, "name":"Alice", "score": 91},
        {"id": 2, "name":"Bob", "score": 85},
        {"id": 3, "name":"Charlie", "score": 88},
    ]
}

print(filter_high_scoring_student(response))