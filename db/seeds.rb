# Пользователи
anton, vladimir, roman =
  User.create!([
                 { name: 'Антон', email: 'anton@mail.ru' },
                 { name: 'Владимир', email: 'vladimir@mail.ru' },
                 { name: 'Роман', email: 'roman@mail.ru' }
               ])
# Категории
chemistry, geography =
  Category.create!([
                     { title: 'Химия' },
                     { title: 'География' },
                     { title: 'Информатика' }
                   ])

nonmetals, oxides, acids =
  chemistry.tests.create!([
                            # Тесты по химии
                            { title: 'Неметаллы', level: 1, author: roman },
                            { title: 'Оксиды', level: 3, author: roman },
                            { title: 'Кислоты', level: 6, author: roman }
                          ])

atmosphere, antarctica, hydrosphere =
  geography.tests.create!([
                            # Тесты по Географии
                            { title: 'Атмосфера', level: 0, author: roman },
                            { title: 'Антарктида', level: 2, author: roman },
                            { title: 'Гидросфера', level: 5, author: roman }
                          ])
# Вопросы к тесту по:
# Атмосфере
at_question_1, at_question_2, at_question_3, at_question_4 =
  atmosphere.questions.create!([
                                 { body: 'Выберите самый нижний слой атмосферы' },
                                 { body: 'Выберите все слои атмосферы строго сверху вниз, исключив слой, который распространен на высоте Эвереста 8848 м' },
                                 { body: 'Укажите в каком слое атмосферы распространяется ионосфера' },
                                 { body: 'Укажите на ошибку в списке воздушных масс' }
                               ])
# Антарктиде
an_question_1, an_question_2, an_question_3, an_question_4 =
  antarctica.questions.create!([
                                 { body: 'Укажите какое место занимает Антарктида по площади территории' },
                                 { body: 'Выберите животное, характерное для антарктических ландшафтов' },
                                 { body: 'Выберите географа-ученого, деятельность которого не связана с Антарктидой' },
                                 { body: 'Крупный свободно плавающий кусок льда в океане или море — это...' }
                               ])
# Гидросфере
hy_question_1, hy_question_2, hy_question_3, hy_question_4 =
  hydrosphere.questions.create!([
                                  { body: 'Укажите реки, воды которых текут в области внутреннего стока' },
                                  { body: 'Испарение и осадки все это часть единого непрерывного природного процесса. Укажите процесс' },
                                  { body: 'Укажите ошибочную форму рельефа океана' },
                                  { body: 'Укажите название участка океана с континентальной корой выветривания' }
                                ])

# Неметаллам
no_question_1, no_question_2, no_question_3, no_question_4 =
  nonmetals.questions.create!([
                                { body: 'Какое из данных веществ используется в медицине, чтобы привести человека в чувства после потери сознания?' },
                                { body: 'Какие два химических элемента, основываясь на сходстве их свойств, можно назвать «братьями»?' },
                                { body: 'Ковалентная полярная связь присутствует в:' },
                                { body: 'Наибольшую степень окисления сера имеет в одном из следующих соединений:' }
                              ])

# Оксидам
ox_question_1, ox_question_2, ox_question_3, ox_question_4 =
  oxides.questions.create!([
                                { body: 'Оксиды – это:' },
                                { body: 'Среди перечисленных кислотным оксидом является:' },
                                { body: 'К несолеобразующим относится:' },
                                { body: 'Какой оксид НЕ может сгореть в кислороде?' }
                              ])

# Кислотам
ac_question_1, ac_question_2, ac_question_3, ac_question_4 =
  acids.questions.create!([
                            { body: 'Какая кислота входит в состав кока-колы?' },
                            { body: 'Какое из приведённых ниже утверждений верно?' },
                            { body: 'Вещество, обладающее высокой чувствительностью к изменению концентрации в растворе некоторых веществ, называется:' },
                            { body: 'С какой кислотой не реагирует серебро?' }
                          ])

# Ответы к тесту по Атмосфере
at_question_1.answers.create!([
                                #  1 вопрос
                                { body: 'Экзосфера', correct: false },
                                { body: 'Ионосфера', correct: false },
                                { body: 'Тропосфера', correct: true },
                                { body: 'Стратосфера', correct: false }
                              ])

at_question_2.answers.create!([
                                #  2 вопрос
                                { body: 'Экзосфера, термосфера, мезосфера, стратосфера', correct: true },
                                { body: 'Термосфера, экзосфера, мезосфера, стратосфера', correct: false },
                                { body: 'Мезосфера, термосфера, стратосфера, тропосфера', correct: false },
                                { body: 'Стратосфера, мезосфера, экзосфера, термосфера', correct: false }
                              ])

at_question_3.answers.create!([
                                #  3 вопрос
                                { body: 'Тропосфера', correct: false },
                                { body: 'Мезосфера', correct: false },
                                { body: 'Стратосфера', correct: false },
                                { body: 'Термосфера', correct: true }
                              ])

at_question_4.answers.create!([
                                #  4 вопрос
                                { body: 'Морские', correct: false },
                                { body: 'Экваториальные', correct: false },
                                { body: 'Умеренные', correct: false },
                                { body: 'Субтропические', correct: true }
                              ])

# Ответы к тесту по Гидросфере
hy_question_1.answers.create!([
                                #  1 вопрос
                                { body: 'Кама, Урал', correct: true },
                                { body: 'Волга, Муррей', correct: false },
                                { body: 'Нигер, Инд', correct: false },
                                { body: 'Амударья, Парана', correct: false }
                              ])

hy_question_2.answers.create!([
                                #  2 вопрос
                                { body: 'Осадконакопление', correct: false },
                                { body: 'Выветривание', correct: false },
                                { body: 'Круговорот воды', correct: true },
                                { body: 'Водная эрозия', correct: false }
                              ])

hy_question_3.answers.create!([
                                #  3 вопрос
                                { body: 'Шельф', correct: false },
                                { body: 'Ложе', correct: false },
                                { body: 'Срединный хребет', correct: false },
                                { body: 'Большой водораздельный хребет', correct: true }
                              ])

hy_question_4.answers.create!([
                                #  4 вопрос
                                { body: 'Ложе', correct: false },
                                { body: 'Шельф', correct: true },
                                { body: 'Желоб', correct: false },
                                { body: 'Котловина', correct: false }
                              ])

# Ответы к тесту по Антарктиде
an_question_1.answers.create!([
                                #  1 вопрос
                                { body: 'Пятое', correct: true },
                                { body: 'Третье', correct: false },
                                { body: 'Четвертое', correct: false },
                                { body: 'Первое', correct: false }
                              ])

an_question_2.answers.create!([
                                #  2 вопрос
                                { body: 'Песец', correct: false },
                                { body: 'Гагара', correct: false },
                                { body: 'Тупик', correct: false },
                                { body: 'Пингвин', correct: true }
                              ])

an_question_3.answers.create!([
                                #  3 вопрос
                                { body: 'Д. Кук', correct: true },
                                { body: 'М. Лазарев', correct: false },
                                { body: 'Р. Амундсен', correct: false },
                                { body: 'Р. Скотт', correct: false }
                              ])

an_question_4.answers.create!([

                                #  4 вопрос
                                { body: 'Шуга', correct: false },
                                { body: 'Шельф', correct: false },
                                { body: 'Айсберг', correct: true },
                                { body: 'Торос', correct: false }
                              ])

no_question_1.answers.create!([
                                # Ответы к тесту по Неметаллам
                                #  1 вопрос
                                { body: 'H2SO4', correct: false },
                                { body: 'KBr', correct: false },
                                { body: 'NH4OH', correct: true },
                                { body: 'I2', correct: false }
                              ])

no_question_2.answers.create!([
                                #  2 вопрос
                                { body: 'Магний и фтор', correct: false },
                                { body: 'Хлор и бром', correct: true },
                                { body: 'Кремний и йод', correct: false },
                                { body: 'Калий и сера', correct: false }
                              ])

no_question_3.answers.create!([
                                #  3 вопрос
                                { body: 'HCI', correct: true },
                                { body: 'KI', correct: false },
                                { body: 'Na2O', correct: false },
                                { body: 'H2', correct: false }
                              ])

no_question_4.answers.create!([
                                #  4 вопрос
                                { body: 'H2SO4', correct: true },
                                { body: 'H2S', correct: false },
                                { body: 'SO2', correct: false },
                                { body: 'K2S', correct: false }
                              ])

# Ответы к тесту по Оксидам
ox_question_1.answers.create!([
                                #  1 вопрос
                                { body: 'Органические соединения различных элементов с кислородом, степень окисления которого равна -2' },
                                { body: 'Органические соединения различных элементов с кислородом, степень окисления которого равна -1' },
                                { body: 'Неорганические соединения различных элементов с кислородом, степень окисления которого равна -1' },
                                { body: 'Неорганические соединения различных элементов с кислородом, степень окисления которого равна -2' }
                              ])

ox_question_2.answers.create!([
                                #  2 вопрос
                                { body: 'Оксид меди', correct: false },
                                { body: 'Оксид серы (VI)', correct: true },
                                { body: 'Оксид бария', correct: false },
                                { body: 'Оксид бария', correct: false }
                              ])

ox_question_3.answers.create!([
                                #  3 вопрос
                                { body: 'NO', correct: true },
                                { body: 'N2O3', correct: false },
                                { body: 'N2O5', correct: false },
                                { body: 'ZnO', correct: false }
                              ])

ox_question_4.answers.create!([
                                #  4 вопрос
                                { body: 'SO2', correct: false },
                                { body: 'N2O3', correct: false },
                                { body: 'CO', correct: false },
                                { body: 'CO2', correct: true }
                              ])

# Ответы к тесту по Кислотам
ac_question_1.answers.create!([
                                #  1 вопрос
                                { body: 'Серная', correct: false },
                                { body: 'Соляная', correct: false },
                                { body: 'Ортофосфорная', correct: true },
                                { body: 'Сернистая', correct: false }
                              ])

ac_question_2.answers.create!([
                                #  2 вопрос
                                { body: 'Кислоты - это вещества, которые являются донорами ионов водорода',
                                  correct: true },
                                { body: 'Все кислоты хорошо растворимы в воде', correct: false },
                                { body: 'Кислотам не свойственно взаимодействие с щелочами.', correct: false },
                                { body: 'Соляная кислота является слабой.', correct: false }
                              ])

ac_question_3.answers.create!([
                                #  3 вопрос
                                { body: 'Катализатор', correct: false },
                                { body: 'Фермент', correct: false },
                                { body: 'Индикатор', correct: true },
                                { body: 'Ингибитор', correct: false }
                              ])

ac_question_4.answers.create!([
                                #  4 вопрос
                                { body: 'H2SO4 концентрированная', correct: false },
                                { body: 'HBr концентрированная', correct: true },
                                { body: 'HNO3 разбавленная', correct: false },
                                { body: 'HNO3 концентрированная', correct: false }
                              ])

anton.test_passings.create!([
                              { passing_status: 'passed', test: nonmetals},
                              { passing_status: 'in_progress', test: oxides, current_question: oxides.questions.first },
                              { passing_status: 'in_progress', test: acids, current_question: ac_question_2 }
                            ])

vladimir.test_passings.create!([
                                 { passing_status: 'in_progress', test: nonmetals, current_question: no_question_3 },
                                 { passing_status: 'passed', test: atmosphere },
                                 { passing_status: 'passed', test: antarctica }
                               ])
