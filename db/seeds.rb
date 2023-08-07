# Категории
chemistry, geography =
  Category.create!([
                     { title: 'Химия' },
                     { title: 'География' },
                     { title: 'Информатика' }
                   ])

nonmetals, oxides, acids, atmosphere, antarctica, hydrosphere =
  Test.create!([
                 # Тесты по химии
                 { title: 'Неметаллы', level: 2, category_id: chemistry.id },
                 { title: 'Оксиды', level: 3, category_id: chemistry.id },
                 { title: 'Кислоты', level: 3, category_id: chemistry.id },
                 # Тесты по Географии
                 { title: 'Атмосфера', level: 2, category_id: geography.id },
                 { title: 'Антарктида', level: 3, category_id: geography.id },
                 { title: 'Гидросфера', level: 3, category_id: geography.id }
               ])
# Вопросы к тесту по:
# Атмосфере
at_question_1, at_question_2, at_question_3, at_question_4,
# Антарктиде
an_question_1, an_question_2, an_question_3, an_question_4,
# Гидросфере
hy_question_1, hy_question_2, hy_question_3, hy_question_4,
# Неметаллам
no_question_1, no_question_2, no_question_3, no_question_4,
# Оксидам
ox_question_1, ox_question_2, ox_question_3, ox_question_4,
# Кислотам
ac_question_1, ac_question_2, ac_question_3, ac_question_4 =
  Question.create!([
                     #  Атмосфере
                     { body: 'Выберите самый нижний слой атмосферы',
                       test_id: atmosphere.id },
                     { body: 'Выберите все слои атмосферы строго сверху вниз, исключив слой, который распространен на высоте Эвереста 8848 м',
                       test_id: atmosphere.id },
                     { body: 'Укажите в каком слое атмосферы распространяется ионосфера',
                       test_id: atmosphere.id },
                     { body: 'Укажите на ошибку в списке воздушных масс',
                       test_id: atmosphere.id },
                     #  Антарктиде
                     { body: 'Укажите какое место занимает Антарктида по площади территории',
                       test_id: antarctica.id },
                     { body: 'Выберите животное, характерное для антарктических ландшафтов',
                       test_id: antarctica.id },
                     { body: 'Выберите географа-ученого, деятельность которого не связана с Антарктидой',
                       test_id: antarctica.id },
                     { body: 'Крупный свободно плавающий кусок льда в океане или море — это...',
                       test_id: antarctica.id },
                     #  Гидросфере
                     { body: 'Укажите реки, воды которых текут в области внутреннего стока',
                       test_id: hydrosphere.id },
                     { body: 'Испарение и осадки все это часть единого непрерывного природного процесса. Укажите процесс',
                       test_id: hydrosphere.id },
                     { body: 'Укажите ошибочную форму рельефа океана',
                       test_id: hydrosphere.id },
                     { body: 'Укажите название участка океана с континентальной корой выветривания',
                       test_id: hydrosphere.id },
                     #  Неметаллам
                     { body: 'Какое из данных веществ используется в медицине, чтобы привести человека в чувства после потери сознания?',
                       test_id: nonmetals.id },
                     { body: 'Какие два химических элемента, основываясь на сходстве их свойств, можно назвать «братьями»?',
                       test_id: nonmetals.id },
                     { body: 'Ковалентная полярная связь присутствует в:',
                       test_id: nonmetals.id },
                     { body: 'Наибольшую степень окисления сера имеет в одном из следующих соединений:',
                       test_id: nonmetals.id },
                     #  Оксидам
                     { body: 'Оксиды – это:', test_id: oxides.id },
                     { body: 'Среди перечисленных кислотным оксидом является:', test_id: oxides.id },
                     { body: 'К несолеобразующим относится:', test_id: oxides.id },
                     { body: 'Какой оксид НЕ может сгореть в кислороде?', test_id: oxides.id },
                     #  Кислотам
                     { body: 'Какая кислота входит в состав кока-колы?', test_id: acids.id },
                     { body: 'Какое из приведённых ниже утверждений верно?', test_id: acids.id },
                     { body: 'Вещество, обладающее высокой чувствительностью к изменению концентрации в растворе некоторых веществ, называется:',
                       test_id: acids.id },
                     { body: 'С какой кислотой не реагирует серебро?', test_id: acids.id }
                   ])

Answer.create!([
                 # Ответы к тесту по Атмосфере

                 #  1 вопрос
                 { body: 'Экзосфера', correct: false, question_id: at_question_1.id },
                 { body: 'Ионосфера', correct: false, question_id: at_question_1.id },
                 { body: 'Тропосфера', correct: true, question_id: at_question_1.id },
                 { body: 'Стратосфера', correct: false, question_id: at_question_1.id },
                 #  2 вопрос
                 { body: 'Экзосфера, термосфера, мезосфера, стратосфера', correct: true,
                   question_id: at_question_2.id },
                 { body: 'Термосфера, экзосфера, мезосфера, стратосфера', correct: false,
                   question_id: at_question_2.id },
                 { body: 'Мезосфера, термосфера, стратосфера, тропосфера', correct: false,
                   question_id: at_question_2.id },
                 { body: 'Стратосфера, мезосфера, экзосфера, термосфера', correct: false,
                   question_id: at_question_2.id },
                 #  3 вопрос
                 { body: 'Тропосфера', correct: false, question_id: at_question_3.id },
                 { body: 'Мезосфера', correct: false, question_id: at_question_3.id },
                 { body: 'Стратосфера', correct: false, question_id: at_question_3.id },
                 { body: 'Термосфера', correct: true, question_id: at_question_3.id },
                 #  4 вопрос
                 { body: 'Морские', correct: false, question_id: at_question_4.id },
                 { body: 'Экваториальные', correct: false, question_id: at_question_4.id },
                 { body: 'Умеренные', correct: false, question_id: at_question_4.id },
                 { body: 'Субтропические', correct: true, question_id: at_question_4.id },

                 # Ответы к тесту по Гидросфере

                 #  1 вопрос
                 { body: 'Кама, Урал', correct: true, question_id: hy_question_1.id },
                 { body: 'Волга, Муррей', correct: false, question_id: hy_question_1.id },
                 { body: 'Нигер, Инд', correct: false, question_id: hy_question_1.id },
                 { body: 'Амударья, Парана', correct: false, question_id: hy_question_1.id },
                 #  2 вопрос
                 { body: 'Осадконакопление', correct: false, question_id: hy_question_2.id },
                 { body: 'Выветривание', correct: false, question_id: hy_question_2.id },
                 { body: 'Круговорот воды', correct: true, question_id: hy_question_2.id },
                 { body: 'Водная эрозия', correct: false, question_id: hy_question_2.id },
                 #  3 вопрос
                 { body: 'Шельф', correct: false, question_id: hy_question_3.id },
                 { body: 'Ложе', correct: false, question_id: hy_question_3.id },
                 { body: 'Срединный хребет', correct: false, question_id: hy_question_3.id },
                 { body: 'Большой водораздельный хребет', correct: true, question_id: hy_question_3.id },
                 #  4 вопрос
                 { body: 'Ложе', correct: false, question_id: hy_question_4.id },
                 { body: 'Шельф', correct: true, question_id: hy_question_4.id },
                 { body: 'Желоб', correct: false, question_id: hy_question_4.id },
                 { body: 'Котловина', correct: false, question_id: hy_question_4.id },

                 # Ответы к тесту по Антарктиде

                 #  1 вопрос
                 { body: 'Пятое', correct: true, question_id: an_question_1.id },
                 { body: 'Третье', correct: false, question_id: an_question_1.id },
                 { body: 'Четвертое', correct: false, question_id: an_question_1.id },
                 { body: 'Первое', correct: false, question_id: an_question_1.id },
                 #  2 вопрос
                 { body: 'Песец', correct: false, question_id: an_question_2.id },
                 { body: 'Гагара', correct: false, question_id: an_question_2.id },
                 { body: 'Тупик', correct: false, question_id: an_question_2.id },
                 { body: 'Пингвин', correct: true, question_id: an_question_2.id },
                 #  3 вопрос
                 { body: 'Д. Кук', correct: true, question_id: an_question_3.id },
                 { body: 'М. Лазарев', correct: false, question_id: an_question_3.id },
                 { body: 'Р. Амундсен', correct: false, question_id: an_question_3.id },
                 { body: 'Р. Скотт', correct: false, question_id: an_question_3.id },
                 #  4 вопрос
                 { body: 'Шуга', correct: false, question_id: an_question_4.id },
                 { body: 'Шельф', correct: false, question_id: an_question_4.id },
                 { body: 'Айсберг', correct: false, question_id: an_question_4.id },
                 { body: 'Торос', correct: false, question_id: an_question_4.id },

                 # Ответы к тесту по Неметаллам

                 #  1 вопрос
                 { body: 'H2SO4', correct: false, question_id: no_question_1.id },
                 { body: 'KBr', correct: false, question_id: no_question_1.id },
                 { body: 'NH4OH', correct: true, question_id: no_question_1.id },
                 { body: 'I2', correct: false, question_id: no_question_1.id },
                 #  2 вопрос
                 { body: 'Магний и фтор', correct: false, question_id: no_question_2.id },
                 { body: 'Хлор и бром', correct: true, question_id: no_question_2.id },
                 { body: 'Кремний и йод', correct: false, question_id: no_question_2.id },
                 { body: 'Калий и сера', correct: false, question_id: no_question_2.id },
                 #  3 вопрос
                 { body: 'HCI', correct: true, question_id: no_question_3.id },
                 { body: 'KI', correct: false, question_id: no_question_3.id },
                 { body: 'Na2O', correct: false, question_id: no_question_3.id },
                 { body: 'H2', correct: false, question_id: no_question_3.id },
                 #  4 вопрос
                 { body: 'H2SO4', correct: true, question_id: no_question_4.id },
                 { body: 'H2S', correct: false, question_id: no_question_4.id },
                 { body: 'SO2', correct: false, question_id: no_question_4.id },
                 { body: 'K2S', correct: false, question_id: no_question_4.id },

                 # Ответы к тесту по Оксидам

                 #  1 вопрос
                 { body: 'Органические соединения различных элементов с кислородом, степень окисления которого равна -2',
                   correct: false, question_id: ox_question_1.id },
                 { body: 'Органические соединения различных элементов с кислородом, степень окисления которого равна -1',
                   correct: false, question_id: ox_question_1.id },
                 { body: 'Неорганические соединения различных элементов с кислородом, степень окисления которого равна -1',
                   correct: false, question_id: ox_question_1.id },
                 { body: 'Неорганические соединения различных элементов с кислородом, степень окисления которого равна -2',
                   correct: true, question_id: ox_question_1.id },
                 #  2 вопрос
                 { body: 'Оксид меди', correct: false, question_id: ox_question_2.id },
                 { body: 'Оксид серы (VI)', correct: true, question_id: ox_question_2.id },
                 { body: 'Оксид бария', correct: false, question_id: ox_question_2.id },
                 { body: 'Оксид бария', correct: false, question_id: ox_question_2.id },
                 #  3 вопрос
                 { body: 'NO', correct: true, question_id: ox_question_3.id },
                 { body: 'N2O3', correct: false, question_id: ox_question_3.id },
                 { body: 'N2O5', correct: false, question_id: ox_question_3.id },
                 { body: 'ZnO', correct: false, question_id: ox_question_3.id },
                 #  4 вопрос
                 { body: 'SO2', correct: false, question_id: ox_question_4.id },
                 { body: 'N2O3', correct: false, question_id: ox_question_4.id },
                 { body: 'CO', correct: false, question_id: ox_question_4.id },
                 { body: 'CO2', correct: true, question_id: ox_question_4.id },

                 # Ответы к тесту по Кислотам

                 #  1 вопрос
                 { body: 'Серная', correct: false, question_id: ac_question_1.id },
                 { body: 'Соляная', correct: false, question_id: ac_question_1.id },
                 { body: 'Ортофосфорная', correct: true, question_id: ac_question_1.id },
                 { body: 'Сернистая', correct: false, question_id: ac_question_1.id },
                 #  2 вопрос
                 { body: 'Кислоты - это вещества, которые являются донорами ионов водорода', correct: true,
                   question_id: ac_question_2.id },
                 { body: 'Все кислоты хорошо растворимы в воде', correct: false, question_id: ac_question_2.id },
                 { body: 'Кислотам не свойственно взаимодействие с щелочами.', correct: false,
                   question_id: ac_question_2.id },
                 { body: 'Соляная кислота является слабой.', correct: false, question_id: ac_question_2.id },
                 #  3 вопрос
                 { body: 'Катализатор', correct: false, question_id: ac_question_3.id },
                 { body: 'Фермент', correct: false, question_id: ac_question_3.id },
                 { body: 'Индикатор', correct: true, question_id: ac_question_3.id },
                 { body: 'Ингибитор', correct: false, question_id: ac_question_3.id },
                 #  4 вопрос
                 { body: 'H2SO4 концентрированная', correct: false, question_id: ac_question_4.id },
                 { body: 'HBr концентрированная', correct: true, question_id: ac_question_4.id },
                 { body: 'HNO3 разбавленная', correct: false, question_id: ac_question_4.id },
                 { body: 'HNO3 концентрированная', correct: false, question_id: ac_question_4.id }
               ])

anton, vladimir,roman = User.create!([
                                  { name: 'Антон' },
                                  { name: 'Владимир' },
                                  { name: 'Роман' }
                                ])
TestPassing.create!([
                      { passing_status: 'passed', user_id: anton.id, test_id: nonmetals.id, author_test: roman.id },
                      { passing_status: 'in_progress', user_id: anton.id, test_id: oxides.id, author_test: roman.id },
                      { passing_status: 'passed', user_id: anton.id, test_id: acids.id, author_test: roman.id },
                      { passing_status: 'passed', user_id: vladimir.id, test_id: nonmetals.id, author_test: roman.id },
                      { passing_status: 'in_progress', user_id: vladimir.id, test_id: atmosphere.id, author_test: roman.id },
                      { passing_status: 'in_progress', user_id: vladimir.id, test_id: antarctica.id, author_test: roman.id }
                    ])
