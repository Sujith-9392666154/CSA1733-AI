% Facts
student(john).
student(mary).
student(alex).

teacher(mr_smith).
teacher(ms_jones).

subject(math).
subject(science).

% Relations: student_subject(Student, Subject), teacher_subject(Teacher, Subject)
student_subject(john, math).
student_subject(mary, science).
student_subject(alex, math).
student_subject(alex, science).

teacher_subject(mr_smith, math).
teacher_subject(ms_jones, science).

% Rules
% Check if a student studies a subject
studies(Student, Subject) :-
    student_subject(Student, Subject).

% Check if a teacher teaches a subject
teaches(Teacher, Subject) :-
    teacher_subject(Teacher, Subject).

% Find the teacher of a particular student for a specific subject
teacher_of_student(Student, Teacher, Subject) :-
    student_subject(Student, Subject),
    teacher_subject(Teacher, Subject).

% Example queries
% Who teaches John?
?- teacher_of_student(john, Teacher, Subject).

% What subjects does Alex study?
?- studies(alex, Subject).

% Who teaches math?
?- teaches(Teacher, math).