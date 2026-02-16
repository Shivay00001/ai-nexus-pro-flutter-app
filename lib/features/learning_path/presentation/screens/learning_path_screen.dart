import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/learning_path_provider.dart';
import '../../domain/entities/learning_path.dart';

class LearningPathScreen extends ConsumerStatefulWidget {
  const LearningPathScreen({super.key});

  @override
  ConsumerState<LearningPathScreen> createState() => _LearningPathScreenState();
}

class _LearningPathScreenState extends ConsumerState<LearningPathScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(learningPathProvider.notifier).loadLearningPath(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(learningPathProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Learning Path'),
        centerTitle: true,
      ),
      body: state.isLoading && state.path == null
          ? const Center(child: CircularProgressIndicator())
          : state.error != null && state.path == null
              ? Center(child: Text(state.error!))
              : _buildPathway(context, state.path!),
    );
  }

  Widget _buildPathway(BuildContext context, LearningPath path) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      itemCount: path.lessons.length,
      itemBuilder: (context, index) {
        final lesson = path.lessons[index];
        final isLast = index == path.lessons.length - 1;

        return Column(
          children: [
            _buildLessonNode(context, lesson),
            if (!isLast) _buildConnector(context, lesson.isCompleted),
          ],
        );
      },
    );
  }

  Widget _buildLessonNode(BuildContext context, Lesson lesson) {
    final color = _getLessonColor(lesson.type);
    final isCompleted = lesson.isCompleted;

    return InkWell(
      onTap: () {
        // Navigate to lesson details
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isCompleted ? color.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCompleted ? color : Colors.grey.withOpacity(0.2),
            width: 2,
          ),
          boxShadow: [
            if (!isCompleted)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getLessonIcon(lesson.type),
                color: color,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lesson.content,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (isCompleted)
              const Icon(Icons.check_circle, color: Colors.green)
            else
              const Icon(Icons.lock_outline, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildConnector(BuildContext context, bool isCompleted) {
    return Container(
      width: 2,
      height: 40,
      color: isCompleted 
          ? Theme.of(context).primaryColor 
          : Colors.grey.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(vertical: 4),
    );
  }

  IconData _getLessonIcon(LessonType type) {
    switch (type) {
      case LessonType.video:
        return Icons.play_circle_outline;
      case LessonType.text:
        return Icons.description_outlined;
      case LessonType.interactive:
        return Icons.extension_outlined;
      case LessonType.exam:
        return Icons.assignment_outlined;
    }
  }

  Color _getLessonColor(LessonType type) {
    switch (type) {
      case LessonType.video:
        return Colors.red;
      case LessonType.text:
        return Colors.blue;
      case LessonType.interactive:
        return Colors.orange;
      case LessonType.exam:
        return Colors.green;
    }
  }
}
