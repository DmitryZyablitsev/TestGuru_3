# Категории
chemistry = Category.create!( title: 'Химия' )
informatics = Category.create!( title: 'Информатика' )
geography = Category.create!( title: 'География' )

# Тесты по химии
nonmetals = Test.create!( title: 'Неметаллы', level: 3, category_id: chemistry.id )
oxides = Test.create!( title: 'Оксиды', level: 3, category_id: chemistry.id )
acids = Test.create!( title: 'Кислоты', level: 3, category_id: chemistry.id )

# Вопросы к тесту по Неметаллам
question_1 = Question.create!( body: 'Какое из данных веществ используется в медицине, чтобы привести человека в чувства после потери сознания?', test_id: nonmetals.id )
question_2 = Question.create!( body: 'Какие два химических элемента, основываясь на сходстве их свойств, можно назвать «братьями»?', test_id: nonmetals.id )
question_3 = Question.create!( body: 'Ковалентная полярная связь присутствует в:', test_id: nonmetals.id )
question_4 = Question.create!( body: 'Наибольшую степень окисления сера имеет в одном из следующих соединений:', test_id: nonmetals.id )
 
# Ответы на 4 вопрос теста по Неметаллам  
answer_1 = Answer.create!( body: 'H2SO4', correct: true, question_id: question_4.id )
answer_2 = Answer.create!( body: 'H2S', correct: false, question_id: question_4.id )
answer_3 = Answer.create!( body: 'SO2', correct: false, question_id: question_4.id )
answer_4 = Answer.create!( body: 'K2S', correct: false, question_id: question_4.id )
