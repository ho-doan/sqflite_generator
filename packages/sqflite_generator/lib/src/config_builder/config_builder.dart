import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

const _analyzerIgnores = '// ignore_for_file: ';

class ConfigGenerator extends GeneratorForAnnotation<SqlConfig> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final emitter = DartEmitter(useNullSafetySyntax: true);
    // if (element is! MethodElement) return null;
    final funcName = element.displayName;
    final functionConfigBuilder = Method((m) {
      m
        ..name = '\$$funcName'
        ..body = Code('''// init
        return;''')
        ..requiredParameters.add(Parameter((p) {
          p
            ..name = 'name'
            ..type = refer('String?');
        }))
        ..returns = refer('void');
    });
    // final s = await buildStep.resolver.libraries.toList();

    // final jsonData = <Map>[];
    // await for (final id in buildStep.findAssets(injectableConfigFiles)) {
    //   final json = jsonDecode(await buildStep.readAsString(id));
    //   jsonData.addAll([...json]);
    // }

    // final deps = <DependencyConfig>[];
    // for (final json in jsonData) {
    //   deps.add(DependencyConfig.fromJson(json));
    // }

    return DartFormatter().format([
      _analyzerIgnores,
      functionConfigBuilder.accept(emitter),
    ].join('\n\n'));
  }
}
