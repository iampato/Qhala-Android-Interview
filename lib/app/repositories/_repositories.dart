library repository;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:moor/moor.dart';
import 'package:qhala/app/models/db/movie_db_model.dart';
import 'package:qhala/app/models/http/movie_model.dart';
import 'package:qhala/app/utils/exceptions.dart';
import 'package:qhala/app/utils/http_client.dart';
import 'package:qhala/app/utils/moor_utils.dart';
import 'package:qhala/app/utils/qhala_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'network_repo.dart';
part 'db_repo.dart';
part 'share_preference.dart';
part '_repositories.g.dart';
