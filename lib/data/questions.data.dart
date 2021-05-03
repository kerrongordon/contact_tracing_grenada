import 'package:contact_tracing_grenada/models/question.model.dart';

final questionsList = QuestionModel(
  questions: [
    Question(
        id: 1,
        question: 'Have you traveled in the past 2-14 days?',
        list: [],
        answer: '',
        yesno: true,
        longanswer: false),
    Question(
        id: 2,
        question:
            'Does your country have any positive COVID-19 patients/cases that may be related to a community spread?',
        list: [],
        answer: '',
        yesno: true,
        longanswer: false),
    Question(
        id: 3,
        question:
            'Have you encountered anyone who tested positive for COVID-19 in the past 2-14 days?',
        list: [],
        answer: '',
        yesno: true,
        longanswer: false),
    Question(
        id: 4,
        question: 'Do you have a temperature above 100.4 degrees Fahrenheit?',
        list: [],
        answer: '',
        yesno: true,
        longanswer: false),
    Question(
        id: 5,
        question:
            'Are you experiencing any of these following symptoms that are not a sign of the common cold? ( If yes, state the symptoms )',
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
        answer: '',
        yesno: false,
        longanswer: true),
    Question(
        id: 6,
        question:
            'Are you experiencing any of these following emergency warning signs? ( If yes, state the symptoms )',
        list: [
          'Difficulty in breathing',
          'Persistent pain or pressure in the chest',
          'New confusion',
          'Inability to wake or stay awake',
          'Pale, Gray, or blue-coloured skin, lips, or nail beds, depending on skin tone',
        ],
        answer: '',
        yesno: false,
        longanswer: true),
  ],
);
