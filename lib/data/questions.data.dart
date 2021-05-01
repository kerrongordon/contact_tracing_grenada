import 'package:contact_tracing_grenada/models/question.model.dart';

final questionsList = QuestionModel(
  questions: [
    Question(
      id: 1,
      question: 'Have you travelled in the past 2-14 days?',
      list: [],
      yes: 2,
      no: 2,
    ),
    Question(
      id: 2,
      question:
          'Does your country have any positive COVID-19 patients/cases that may be related to a community spread?',
      list: [],
      yes: 2,
      no: 2,
    ),
    Question(
      id: 3,
      question:
          'Have you encountered someone who tested positive for COVID-19 in the past 2-14 days?',
      list: [],
      yes: 2,
      no: 2,
    ),
    Question(
      id: 4,
      question:
          'Are you experiencing any of these following symptoms that are not a sign of the common cold?',
      list: [
        'Fever/Chills',
        'Cough',
        'Shortness of breath/ Difficulty breathing',
        'Fatigue',
        'Body aches',
        'Headache',
        'New loss of taste',
        'New loss of smell',
        'Sore throat',
        'Congestion/ Runny nose',
        'Nausea',
        'Diarrhea',
      ],
      yes: 2,
      no: 2,
    ),
    Question(
      id: 5,
      question:
          'Are you experiencing any of these following emergency warning signs?',
      list: [
        'Difficulty in breathing',
        'Persistent pain or pressure in the chest',
        'New confusion',
        'Inability to wake or stay awake',
        'Pale, Gray, or blue-coloured skin, lips, or nail beds, depending on skin tone',
      ],
      yes: 2,
      no: 2,
    ),
  ],
);
