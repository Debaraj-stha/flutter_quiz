import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/model.dart';
import 'package:http/http.dart' as http;

// import 'package:http/http.dart'as http;
class quizProvider with ChangeNotifier {
  int currentIndex = 0;
  late bool isCorrect = false;
  bool isAlreadyAnswer = false;
  List<QuizQuestion> questions = [];
  String selectedAnswerKey = "";
  String message = "";
  int score = 0;
  String apiKey = "ij9Vx9hZpp2bPT5YmgdcqoYiAfcESL5gWpfIK8l2";
  List<String> quizSection = [
    "Laravel",
    "JavaScript",
    "Linux",
    "HTML",
    "Docker",
    "WordPress",
    "DevOps",
    "BASH",
    "MySQL"
  ];

  List<Map<String, dynamic>> datas = [
    {
      "id": 649,
      "question": "What is Solaris?",
      "description": null,
      "answers": {
        "answer_a": "HP’s UNIX",
        "answer_b": "IBM’s UNIX",
        "answer_c": "Sun microsystems UNIX",
        "answer_d": "Microsoft’s UNIX",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "false",
        "answer_c_correct": "true",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "BASH"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 709,
      "question":
          "Which special namespace is used for special purposes like bootstrapping a cluster?",
      "description": null,
      "answers": {
        "answer_a": "default",
        "answer_b": "kube-public",
        "answer_c": "kube-private",
        "answer_d": "kube-default",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "true",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation":
          "The kube-public namespace is created automatically and is readable by all users (including those not authenticated). This namespace is mostly reserved for cluster usage, in case that some resources should be visible and readable publicly throughout the whole cluster. The public aspect of this namespace is only a convention, not a requirement.",
      "tip": null,
      "tags": [
        {"name": "Kubernetes"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 711,
      "question": "Are arrays supported in shell scripts?",
      "description": null,
      "answers": {
        "answer_a": "True",
        "answer_b": "False",
        "answer_c": "Yes but only under certain conditions",
        "answer_d": null,
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": null,
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "BASH"},
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 7,
      "question": "How do we change permissions on files",
      "description": null,
      "answers": {
        "answer_a": "chown",
        "answer_b": "chmod",
        "answer_c": "chattr",
        "answer_d": "lsattr",
        "answer_e": "We Can't change them",
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "true",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Linux"},
        {"name": "BASH"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 713,
      "question":
          "Which command can be used to stop the current executing process in the background?",
      "description": null,
      "answers": {
        "answer_a": "kill",
        "answer_b": "stop",
        "answer_c": "remove",
        "answer_d": "rm",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": null,
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "BASH"},
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 1082,
      "question":
          "If you wish to have something mounted when the server is booted in which file would you need to add it:",
      "description": null,
      "answers": {
        "answer_a": "/etc/fstab",
        "answer_b": "/etc/boot",
        "answer_c": "/etc/grub.conf",
        "answer_d": "/etc/boot.conf",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": null,
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 737,
      "question":
          "How to delete a pod in Kubernetes using the type and name specified in pod.json?",
      "description": null,
      "answers": {
        "answer_a": "kubectl delete ./pod.json",
        "answer_b": "kubectl delete -f ./pod.json",
        "answer_c": "kubectl remove -f ./pod.json",
        "answer_d": "kubectl remove ./pod.json",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "true",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Kubernetes"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 662,
      "question":
          "Which command can give first found difference between two file after comparing?",
      "description": null,
      "answers": {
        "answer_a": "diff",
        "answer_b": "cmp",
        "answer_c": "Common",
        "answer_d": "stat",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "true",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "BASH"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 678,
      "question":
          "In which directory by default user home directories are created?",
      "description": null,
      "answers": {
        "answer_a": "/home",
        "answer_b": "/usr",
        "answer_c": "/tmp",
        "answer_d": "/etc",
        "answer_e": "/user",
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": null,
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "BASH"},
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 14,
      "question": "What command is used to clear up the command prompt window?",
      "description": null,
      "answers": {
        "answer_a": "clearit",
        "answer_b": "clrwin",
        "answer_c": "clear",
        "answer_d": "clrscr",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "false",
        "answer_c_correct": "true",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_c",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 1077,
      "question":
          "You are logged in as a normal user and you see a file with 444(-r--r--r--) permission. Can you delete it with the `rm` command?",
      "description": null,
      "answers": {
        "answer_a":
            "We can't be certain, it depends on the permissions of the parent folder",
        "answer_b": "Yes, can delete it without a problem",
        "answer_c": "No, we don't have the proper permissions",
        "answer_d": "We can delete it only from the GUI but not from CLI.",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": null,
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 8,
      "question": "When do we use the GREP command",
      "description": null,
      "answers": {
        "answer_a": "When we want to search for a string",
        "answer_b": "To find a file",
        "answer_c": "To find a directory",
        "answer_d":
            "To show all directories which have the string in their name",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "true",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Linux"},
        {"name": "BASH"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 717,
      "question": "Which command is used to create a deployment in Kubernetes?",
      "description": null,
      "answers": {
        "answer_a": "kubectl run",
        "answer_b": "kubernetes set deployment",
        "answer_c": "kubectl deploy",
        "answer_d": "kubectl apply deployment",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Kubernetes"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 714,
      "question":
          "What could be used to program additional authentication logic besides available authenticator modules?",
      "description": null,
      "answers": {
        "answer_a": "Kube Vault",
        "answer_b": "Authentication Proxy",
        "answer_c": "Kube Auth Service",
        "answer_d": "Kubernetes Role Manager",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "true",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation":
          "Using Authentication Proxy, the API server can extract the information it needs about the user’s identity using the HTTP headers that you specify. Let’s have a quick example to demonstrate this concept:",
      "tip": null,
      "tags": [
        {"name": "Kubernetes"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 680,
      "question": "How can you display the top 10 number of lines of a file?",
      "description": null,
      "answers": {
        "answer_a": "head −n 10 file.txt",
        "answer_b": "head -f 10 file.txt",
        "answer_c": "head --display-only 10 file.txt",
        "answer_d": "head -show 10 file.txt",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": null,
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "BASH"},
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 668,
      "question": "What will the following command do - chmod 888 file",
      "description": null,
      "answers": {
        "answer_a": "It enables r,w,x premissions for all users",
        "answer_b": "It disables r,w,x premissions for all users",
        "answer_c": "It enables r,w,x permissions only for owner of the file",
        "answer_d": "None of the above.",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "true",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation":
          "We can provide the permission values in octal number system and 888 is not a valid octal number.",
      "tip": null,
      "tags": [
        {"name": "BASH"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 749,
      "question": "What is the Container Runtime?",
      "description": null,
      "answers": {
        "answer_a": "Software that is responsible for running containers",
        "answer_b": "An API object that manages a replicated application",
        "answer_c":
            "Stored instance of a Container that holds a set of software needed to run an application",
        "answer_d":
            "A command line tool for communicating with a Kubernetes API server",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Kubernetes"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 719,
      "question":
          "The kube-apiserver on Kubernetes master is designed to scale:",
      "description": null,
      "answers": {
        "answer_a": "Vertically",
        "answer_b": "Horizontally",
        "answer_c": "kube-apiserver is not used for scaling",
        "answer_d": null,
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "true",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_a",
      "explanation":
          "The Kubernetes API server validates and configures data for the api objects which include pods, services, replicationcontrollers, and others. The API Server services REST operations and provides the frontend to the cluster’s shared state through which all other components interact.",
      "tip": null,
      "tags": [
        {"name": "Kubernetes"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 46,
      "question":
          "Which of the following answers refers to a software tool used for searching and installing software packages on Debian and Debian-based Linux distributions?",
      "description": null,
      "answers": {
        "answer_a": "rpm",
        "answer_b": "apt-rpm",
        "answer_c": "yum",
        "answer_d": "apt-get",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "false",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "true",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": "answer_d",
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "Linux"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    },
    {
      "id": 682,
      "question": "Expand JFS in context of file system?",
      "description": null,
      "answers": {
        "answer_a": "Journal File System",
        "answer_b": "Journal Failing System",
        "answer_c": "Journal File Service",
        "answer_d": "Journal Failing Service",
        "answer_e": null,
        "answer_f": null
      },
      "multiple_correct_answers": "false",
      "correct_answers": {
        "answer_a_correct": "true",
        "answer_b_correct": "false",
        "answer_c_correct": "false",
        "answer_d_correct": "false",
        "answer_e_correct": "false",
        "answer_f_correct": "false"
      },
      "correct_answer": null,
      "explanation": null,
      "tip": null,
      "tags": [
        {"name": "BASH"}
      ],
      "category": "Linux",
      "difficulty": "Easy"
    }
  ];

  fetchQuestion(String category, String level, {int limit = 20}) async {
    for (var item in datas) {
      questions.add(QuizQuestion.fromJson(item));
    }
    isAlreadyAnswer = false;
    score = 0;
    message = "";
    isCorrect = false;
    currentIndex = 0;
    // questions = [];
    String u =
        "https://quizapi.io/api/v1/questions?apiKey=ij9Vx9hZpp2bPT5YmgdcqoYiAfcESL5gWpfIK8l2&limit=10&category=Linux&difficulty=easy";
    String url =
        "https://quizapi.io/api/v1/questions?apiKey=${apiKey}&category=$category&limit=20&difficulty=$level";
    debugPrint("url " + url);
    final respponse = await http.get(Uri.parse(url));
    final data = jsonDecode(respponse.body);
    if (respponse.statusCode == 200) {
      for (var item in data) {
        questions.add(QuizQuestion.fromJson(item));
      }
    } else {
      debugPrint(respponse.body);
      message = respponse.body.toString();
    }
    notifyListeners();
  }

  void increaseCurrentidex() {
    currentIndex++;
    isCorrect = false;
    selectedAnswerKey = "";
    isAlreadyAnswer = false;
    notifyListeners();
  }

  void selectAnswer(
      String selectAnswerKey, Map<String, dynamic> correctAnswers) {
    final correctAnswerKey = selectAnswerKey + "_correct";
    isAlreadyAnswer = true;
    if (correctAnswers.containsKey(correctAnswerKey) &&
        correctAnswers[correctAnswerKey] == "true") {
      isCorrect = true;
      score += 1;
    } else {
      isCorrect = false;
    }

    selectedAnswerKey = selectAnswerKey; // Update the selected answer key
    debugPrint(selectAnswerKey + "selectedAnswerKey=");
    notifyListeners();
  }
  void handlePopUpMenu(String value){
    
  }
}
