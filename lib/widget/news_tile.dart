// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widget/web_page_view.dart';
// import 'package:news_app/widget/web_page_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              url: articleModel.url,
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            // child: CachedNetworkImage(
            //     imageUrl: articleModel.image ?? 'https://via.placeholder.com/150',
            //     height: 200,
            //     width: double.infinity,
            //     fit: BoxFit.cover,
            //     placeholder: (context, url) => const Center(
            //       child: CircularProgressIndicator(),
            //     ),
            //     errorWidget: (context, url, error) => const Center(
            //       child: Icon(Icons.error),
            //     ),
            //   ),
            child: Image.network(
              // After ?? the error image link 🤪
              articleModel.image ??
                  'https://cdn.dribbble.com/users/2463540/screenshots/5884553/media/a375760f7367c3437576d9d1a95d8975.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            articleModel.title,
            // maxmum 2 lines
            maxLines: 2,
            // bhjcjhdbsd...
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}
