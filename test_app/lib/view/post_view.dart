import 'package:flutter/material.dart';
import 'package:test_app/model/posting.dart';

class PostView extends StatelessWidget {
  final Posting post;

  const PostView({super.key, required this.post});

  String formatDate(String? date) {
    if (date == null) return '';

    try {
      DateTime dateTime = DateTime.parse(date);
      return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} '
          '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 작성자 정보
            Text(
              '작성자: ${post.userEmail}',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            // 작성일자와 상태 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDate(post.date),
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      post.public == 'Y' ? Icons.public : Icons.lock,
                      size: screenWidth * 0.04,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      post.complete == 'Y' ? '답변완료' : '답변대기',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color:
                            post.complete == 'Y' ? Colors.green : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),

            // 문의 내용
            Text(
              '문의내용',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                post.question,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
            ),

            // 답변 섹션
            SizedBox(height: screenHeight * 0.03),
            Text(
              '답변',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: post.answer != null ? Colors.blue[50] : Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                post.answer ?? '아직 답변이 등록되지 않았습니다.',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: post.answer != null ? Colors.black : Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
