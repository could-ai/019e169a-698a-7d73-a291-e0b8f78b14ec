import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const QuantumLeapApp());
}

class QuantumLeapApp extends StatelessWidget {
  const QuantumLeapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Квантовый прыжок к мечте',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/stage1': (context) => const Stage1Screen(),
        '/quiz': (context) => const QuizScreen(),
        '/stage2': (context) => const Stage2Screen(),
        '/stage3': (context) => const Stage3Screen(),
        '/stage4': (context) => const Stage4Screen(),
        '/stage5': (context) => const Stage5Screen(),
        '/stage6': (context) => const Stage6Screen(),
        '/stage7': (context) => const Stage7Screen(),
      },
    );
  }
}

// ---------------- Welcome Screen ---------------- //

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SUPER JUMP представляет',
                style: TextStyle(color: Colors.white70, fontSize: 16, letterSpacing: 2),
              ),
              const SizedBox(height: 16),
              const Text(
                'КВАНТОВЫЙ ПРЫЖОК К МЕЧТЕ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const Text(
                'Фильм-новелла «Рай на Земле» начинается здесь.\nВы — режиссёр своей жизни.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white60),
              ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                icon: const Icon(Icons.movie_creation),
                label: const Text('Начать съёмку'),
                onPressed: () => Navigator.pushNamed(context, '/stage1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Stage 1: Wheel & Quiz ---------------- //

class Stage1Screen extends StatefulWidget {
  const Stage1Screen({super.key});

  @override
  State<Stage1Screen> createState() => _Stage1ScreenState();
}

class _Stage1ScreenState extends State<Stage1Screen> {
  final List<String> spheres = [
    'Карьера/Дело', 'Отношения/Партнёрство', 'Здоровье/Тело', 'Финансы/Ресурсы',
    'Творчество/Реализация', 'Семья/Род', 'Духовность/Смыслы', 'Сообщество/Друзья'
  ];
  String? selectedSphere;

  void _spinWheel() {
    setState(() {
      selectedSphere = spheres[Random().nextInt(spheres.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Этап 1: Барабан Сфер')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Определим сферу жизни для вашей роли',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: _spinWheel,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.purple.withOpacity(0.5), blurRadius: 20, spreadRadius: 5)
                    ],
                  ),
                  child: Center(
                    child: Text(
                      selectedSphere ?? 'КРУТИТЬ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              if (selectedSphere != null) ...[
                Text(
                  'Ваша сфера: $selectedSphere',
                  style: const TextStyle(fontSize: 24, color: Colors.amber),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/quiz'),
                  child: const Text('Пройти кастинг (Квиз)'),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  final List<Map<String, dynamic>> questions = [
    {
      'q': 'Когда ситуация выходит из-под контроля, вы:',
      'a': [
        {'text': 'Усиливаю давление и требую результата', 'type': 'tyrant'},
        {'text': 'Опускаю руки и жду помощи', 'type': 'victim'},
        {'text': 'Адаптируюсь и ищу новые решения', 'type': 'creator'},
      ]
    },
    {
      'q': 'В отношениях с командой вы чаще всего:',
      'a': [
        {'text': 'Считаю, что лучше меня никто не сделает', 'type': 'tyrant'},
        {'text': 'Соглашаюсь, лишь бы не было конфликта', 'type': 'victim'},
        {'text': 'Распределяю ответственность', 'type': 'creator'},
      ]
    },
    {
      'q': 'При неудаче ваша первая мысль:',
      'a': [
        {'text': 'Кто в этом виноват?', 'type': 'tyrant'},
        {'text': 'За что мне это?', 'type': 'victim'},
        {'text': 'Какой урок я могу извлечь?', 'type': 'creator'},
      ]
    }
  ];

  Map<String, int> scores = {'tyrant': 0, 'victim': 0, 'creator': 0};

  void _answer(String type) {
    scores[type] = scores[type]! + 1;
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    String role = 'Со-Творец';
    String genre = 'Эпос со-творения';
    if (scores['tyrant']! > scores['creator']! && scores['tyrant']! >= scores['victim']!) {
      role = 'Тиран (Мужская энергия в тени)';
      genre = 'Триллер контроля';
    } else if (scores['victim']! > scores['creator']! && scores['victim']! > scores['tyrant']!) {
      role = 'Жертва (Женская энергия в тени)';
      genre = 'Драма выживания';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Кастинг завершен'),
        content: Text('Жанр вашей жизни: $genre\nТекущая роль: $role'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/stage2');
            },
            child: const Text('Перейти к Этапу 2'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Квиз: Жанр и Роль')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Вопрос ${currentQuestion + 1}/${questions.length}',
                style: const TextStyle(fontSize: 18, color: Colors.white54),
              ),
              const SizedBox(height: 16),
              Text(
                questions[currentQuestion]['q'],
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              ...(questions[currentQuestion]['a'] as List).map((answer) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () => _answer(answer['type']),
                      child: Text(answer['text'], textAlign: TextAlign.center),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Stage 2: Point B & Audio ---------------- //

class Stage2Screen extends StatelessWidget {
  const Stage2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Этап 2: Погружение')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.music_note, size: 64, color: Colors.amber),
            const SizedBox(height: 16),
            const Text(
              'Песня: Мечта сбылась',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Настроение: Вдохновляющее, 120 BPM, Мажор\n(Плейсхолдер для аудио Suno/Udio)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 32),
            Card(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Заявка на кастинг', style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 16),
                    TextField(decoration: const InputDecoration(labelText: 'Имя актёра')),
                    const SizedBox(height: 16),
                    TextField(decoration: const InputDecoration(labelText: 'Ваша сфера')),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/stage3'),
                      child: const Text('Отправить заявку'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ---------------- Stage 3: Alias Emotions ---------------- //

class Stage3Screen extends StatefulWidget {
  const Stage3Screen({super.key});

  @override
  State<Stage3Screen> createState() => _Stage3ScreenState();
}

class _Stage3ScreenState extends State<Stage3Screen> {
  final List<Map<String, String>> emotions = [
    {'name': 'Гнев (Тень)', 'icon': '🌋'},
    {'name': 'Вдохновение (Дар)', 'icon': '✨'},
    {'name': 'Обида (Тень)', 'icon': '🌧️'},
    {'name': 'Благодарность (Дар)', 'icon': '☀️'},
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Этап 3: Алиас Эмоций')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Объясните эмоцию без слов (Таймер: 60с)'),
              const SizedBox(height: 32),
              Card(
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(emotions[currentIndex]['icon']!, style: const TextStyle(fontSize: 48)),
                      const SizedBox(height: 16),
                      Text(
                        emotions[currentIndex]['name']!,
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                    onPressed: () {
                      setState(() {
                        currentIndex = (currentIndex + 1) % emotions.length;
                      });
                    },
                    child: const Text('Пропустить'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      setState(() {
                        currentIndex = (currentIndex + 1) % emotions.length;
                      });
                    },
                    child: const Text('Угадали!'),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/stage4'),
                child: const Text('Далее к Этапу 4', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Stage 4: Point B Image ---------------- //

class Stage4Screen extends StatelessWidget {
  const Stage4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Этап 4: Образ «Я»')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Портрет актёра в Точке Б',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Каким я себя ощущаю в версии мечты?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Комплименты команды (Наблюдение + Сила + Метафора):'),
                    ListTile(leading: Icon(Icons.star), title: Text('Ты как главный герой блокбастера, пробивающий стены!')),
                    ListTile(leading: Icon(Icons.star), title: Text('Твоя энергия как свет софитов, освещает путь!')),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/stage5'),
              child: const Text('Перейти к Речи'),
            )
          ],
        ),
      ),
    );
  }
}

// ---------------- Stage 5: Speech ---------------- //

class Stage5Screen extends StatelessWidget {
  const Stage5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Этап 5: Триумфальная Речь')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Структура монолога:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const ListTile(leading: Text('1.'), title: Text('Благодарность съемочной группе')),
          const ListTile(leading: Text('2.'), title: Text('Признание пути (От Тени к Дару)')),
          const ListTile(leading: Text('3.'), title: Text('Фиксация Точки Б')),
          const ListTile(leading: Text('4.'), title: Text('Обещание действовать')),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            icon: const Icon(Icons.mic),
            label: const Text('Записать репетицию'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Запись начата (демо)...')));
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/stage6'),
            child: const Text('Далее к Этюдам'),
          )
        ],
      ),
    );
  }
}

// ---------------- Stage 6: Field & Cards ---------------- //

class Stage6Screen extends StatefulWidget {
  const Stage6Screen({super.key});

  @override
  State<Stage6Screen> createState() => _Stage6ScreenState();
}

class _Stage6ScreenState extends State<Stage6Screen> {
  bool showShadow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Этап 6: Удержание Состояния')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Игровая карточка ситуаций', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () => setState(() => showShadow = !showShadow),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: showShadow ? Colors.grey[800] : Colors.amber[800],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black54)],
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        showShadow ? 'ЛИЦО (Тень)' : 'ОБОРОТ (Дар)',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Divider(),
                      Text(
                        showShadow
                            ? 'Ситуация: Дедлайн сорван.\nРеакция: Гнев, обвинения.\nСтрах: Потеря контроля.\nИтог: Токсичность.'
                            : 'Упражнение: Пауза-дым-вопрос.\nОсознанность: Принятие и поиск решения.\nИтог: Лояльность команды.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text('(Нажмите чтобы перевернуть)', style: TextStyle(fontSize: 12, color: Colors.white54)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/stage7'),
                child: const Text('Финальное действие'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Stage 7: Action & Final ---------------- //

class Stage7Screen extends StatelessWidget {
  const Stage7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Этап 7: Действие из Нового «Я»')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Выберите действие:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.group_add),
              title: const Text('Пригласить 3 друзей на кастинг'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.handshake),
              title: const Text('Помочь другу в выбранной сфере'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Присоединиться к SUPER JUMP'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 48),
          const Divider(),
          const SizedBox(height: 24),
          const Text('СЪЁМКИ ЗАВЕРШЕНЫ', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.download),
            label: const Text('Скачать PDF-Сертификат Актёра'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
