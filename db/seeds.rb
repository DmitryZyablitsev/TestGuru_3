# Категории
chemistry = Category.create!(title: 'Химия')
Category.create!([
                   { title: 'Информатика' },
                   { title: 'География' }
                 ])

# Тесты по химии
nonmetals = Test.create!(title: 'Неметаллы', level: 2, category_id: chemistry.id)
oxides = Test.create!(title: 'Оксиды', level: 3, category_id: chemistry.id)
acids = Test.create!(title: 'Кислоты', level: 3, category_id: chemistry.id)

# Вопросы к тесту по Неметаллам
no_question_1 = Question.create!(
  body: 'Какое из данных веществ используется в медицине, чтобы привести человека в чувства после потери сознания?',
  test_id: nonmetals.id
)
no_question_2 = Question.create!(
  body: 'Какие два химических элемента, основываясь на сходстве их свойств, можно назвать «братьями»?',
  test_id: nonmetals.id
)
no_question_3 = Question.create!(body: 'Ковалентная полярная связь присутствует в:', test_id: nonmetals.id)
no_question_4 = Question.create!(body: 'Наибольшую степень окисления сера имеет в одном из следующих соединений:',
                                 test_id: nonmetals.id)

# Вопросы к тесту по Оксидам
ox_question_1 = Question.create!(body: 'Оксиды – это:', test_id: oxides.id)
ox_question_2 = Question.create!(body: 'Среди перечисленных кислотным оксидом является:', test_id: oxides.id)
ox_question_3 = Question.create!(body: 'К несолеобразующим относится:', test_id: oxides.id)
ox_question_4 = Question.create!(body: 'Какой оксид НЕ может сгореть в кислороде?', test_id: oxides.id)

# Вопросы к тесту по Кислотам
ac_question_1 = Question.create!(body: 'Какая кислота входит в состав кока-колы?', test_id: acids.id)
ac_question_2 = Question.create!(body: 'Какое из приведённых ниже утверждений верно?', test_id: acids.id)
ac_question_3 = Question.create!(
  body: 'Вещество, обладающее высокой чувствительностью к изменению концентрации в растворе некоторых веществ, называется:',
  test_id: acids.id
)
ac_question_4 = Question.create!(body: 'С какой кислотой не реагирует серебро?', test_id: acids.id)

# Ответы к тесту по Неметаллам
Answer.create!([
                 # Ответы на 1 вопрос
                 { body: 'H2SO4', correct: false, question_id: no_question_1.id },
                 { body: 'KBr', correct: false, question_id: no_question_1.id },
                 { body: 'NH4OH', correct: true, question_id: no_question_1.id },
                 { body: 'I2', correct: false, question_id: no_question_1.id },

                 # Ответы на 2 вопрос
                 { body: 'Магний и фтор', correct: false, question_id: no_question_2.id },
                 { body: 'Хлор и бром', correct: true, question_id: no_question_2.id },
                 { body: 'Кремний и йод', correct: false, question_id: no_question_2.id },
                 { body: 'Калий и сера', correct: false, question_id: no_question_2.id },

                 # Ответы на 3 вопрос
                 { body: 'HCI', correct: true, question_id: no_question_3.id },
                 { body: 'KI', correct: false, question_id: no_question_3.id },
                 { body: 'Na2O', correct: false, question_id: no_question_3.id },
                 { body: 'H2', correct: false, question_id: no_question_3.id },

                 # Ответы на 4 вопрос
                 { body: 'H2SO4', correct: true, question_id: no_question_4.id },
                 { body: 'H2S', correct: false, question_id: no_question_4.id },
                 { body: 'SO2', correct: false, question_id: no_question_4.id },
                 { body: 'K2S', correct: false, question_id: no_question_4.id }
               ])

# Ответы к тесту по Оксидам
Answer.create!([
                 # Ответы на 1 вопрос
                 { body: 'Органические соединения различных элементов с кислородом, степень окисления которого равна -2',
                   correct: false, question_id: ox_question_1.id },
                 { body: 'Органические соединения различных элементов с кислородом, степень окисления которого равна -1',
                   correct: false, question_id: ox_question_1.id },
                 { body: 'Неорганические соединения различных элементов с кислородом, степень окисления которого равна -1',
                   correct: false, question_id: ox_question_1.id },
                 { body: 'Неорганические соединения различных элементов с кислородом, степень окисления которого равна -2',
                   correct: true, question_id: ox_question_1.id },

                 # Ответы на 2 вопрос
                 { body: 'Оксид меди', correct: false, question_id: ox_question_2.id },
                 { body: 'Оксид серы (VI)', correct: true, question_id: ox_question_2.id },
                 { body: 'Оксид бария', correct: false, question_id: ox_question_2.id },
                 { body: 'Оксид бария', correct: false, question_id: ox_question_2.id },

                 # Ответы на 3 вопрос
                 { body: 'NO', correct: true, question_id: ox_question_3.id },
                 { body: 'N2O3', correct: false, question_id: ox_question_3.id },
                 { body: 'N2O5', correct: false, question_id: ox_question_3.id },
                 { body: 'ZnO', correct: false, question_id: ox_question_3.id },

                 # Ответы на 4 вопрос
                 { body: 'SO2', correct: false, question_id: ox_question_4.id },
                 { body: 'N2O3', correct: false, question_id: ox_question_4.id },
                 { body: 'CO', correct: false, question_id: ox_question_4.id },
                 { body: 'CO2', correct: true, question_id: ox_question_4.id }
               ])

# Ответы к тесту по Кислотам
Answer.create!([
                 # Ответы на 1 вопрос
                 { body: 'Серная', correct: false, question_id: ac_question_1.id },
                 { body: 'Соляная', correct: false, question_id: ac_question_1.id },
                 { body: 'Ортофосфорная', correct: true, question_id: ac_question_1.id },
                 { body: 'Сернистая', correct: false, question_id: ac_question_1.id },

                 # Ответы на 2 вопрос
                 { body: 'Кислоты - это вещества, которые являются донорами ионов водорода', correct: true,
                   question_id: ac_question_2.id },
                 { body: 'Все кислоты хорошо растворимы в воде', correct: false, question_id: ac_question_2.id },
                 { body: 'Кислотам не свойственно взаимодействие с щелочами.', correct: false,
                   question_id: ac_question_2.id },
                 { body: 'Соляная кислота является слабой.', correct: false, question_id: ac_question_2.id },

                 # Ответы на 3 вопрос
                 { body: 'Катализатор', correct: false, question_id: ac_question_3.id },
                 { body: 'Фермент', correct: false, question_id: ac_question_3.id },
                 { body: 'Индикатор', correct: true, question_id: ac_question_3.id },
                 { body: 'Ингибитор', correct: false, question_id: ac_question_3.id },

                 # Ответы на 4 вопрос
                 { body: 'H2SO4 концентрированная', correct: false, question_id: ac_question_4.id },
                 { body: 'HBr концентрированная', correct: true, question_id: ac_question_4.id },
                 { body: 'HNO3 разбавленная', correct: false, question_id: ac_question_4.id },
                 { body: 'HNO3 концентрированная', correct: false, question_id: ac_question_4.id }
               ])
