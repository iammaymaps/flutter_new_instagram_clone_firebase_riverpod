import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/Failure.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureVoid<T> = FutureEither<void>;
