data = [
{'department': 'CS', 'score': 85},
{'department': 'IT', 'score': 92},
{'department': 'CS', 'score': 78},
{'department': 'IT', 'score': 88},
{'department': 'EC', 'score': 75}
]

def average_score_by_department(data):
    department_totals = {}
    department_counts = {}

    for i in data:
        dept = i['department']
        score = i['score']

        if dept not in  department_totals:
            department_totals[dept] = 0
            department_counts[dept] = 0

        department_totals[dept] += score
        department_counts[dept] +=1

    average = {}
    for dept in department_totals:
        average[dept] = department_totals[dept] / department_counts[dept]

    return average

result = average_score_by_department(data)
print(result)