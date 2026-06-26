VocabularyTest.delete_all
TaskCompletion.delete_all
Task.delete_all
Homework.delete_all
NotificationClassroom.delete_all
Notification.delete_all
User.delete_all
Classroom.delete_all

classrooms = [
  [ 'TOEIC', 'Toeic' ],
  [ '準1級', 'Pre1' ],
  [ '2級', 'STEP2' ],
  [ '準2級プラス', 'Pre2 plus' ],
  [ '準2級', 'Pre2' ],
  [ '中学生3級', 'JH1 STEP3' ],
  [ '中学生4級', 'JH1 STEP4' ],
  [ '中学生5級', 'JH1 Beginner' ],
  [ '小学生2級', 'EH STEP2' ],
  [ '小学生準2プラス', 'EH Pre2 plus' ],
  [ '小学生準2級', 'EH pre2' ],
  [ '小学生3級', 'EH3' ],
  [ '小学生高学年4級', 'EH4' ],
  [ '小学生低学年4級', 'EL4' ],
  [ '小学生高学年5級', 'EH5' ],
  [ '小学生低学年5級', 'EL5' ]
]

created_classrooms = classrooms.map do |name, level|
  Classroom.create!(
    eiken_level: level,
    name: name
  )
end

users_data = [
  [ "上拾石", "kenta555",   "準1級"         ],
  [ "大川",   "kotaro555",  "2級"           ],
  [ "片山",   "daiki555",   "準2級"         ],
  [ "矢野",   "tsubasa555", "準2級プラス"    ],
  [ "宮田",   "suzuka555",  "中学生3級"     ],
  [ "大塚",   "mitsuki555", "小学生高学年5級" ],
  [ "稲荷",   "hinako555",  "小学生高学年4級" ],
  [ "ゲスト",   "guest555",  "TOEIC" ]
]

users = users_data.map do |name, student_id, classroom_name|
  User.create!(
    name: name,
    student_id: student_id,
    password: student_id,
    password_confirmation: student_id,
    classroom: find_class(classrooms, classroom_name),
    role: 1
  )
end
