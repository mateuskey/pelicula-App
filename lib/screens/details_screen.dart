import 'package:flutter/material.dart';
import 'package:peliculas/widgets/casting_cards.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // tod-o: cambiar por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards(),

            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  // SliverAppBar es parecio a AppBar
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo[900],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'movie.tittle',
            style: TextStyle( fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only( top: 20),
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),

          SizedBox( width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines:  2),
              Text('movie.originalTitle', style: textTheme.headline5, overflow: TextOverflow.ellipsis),

              Row(
                children: [
                  Icon( Icons.star_half_outlined, size: 20, color: Colors.blue,),
                  SizedBox( width: 5,),
                  Text('movie.voteAverage', style: textTheme.caption)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
      child: Text(
        'Esse Lorem adipisicing qui quis laboris do velit. Qui voluptate laborum irure laboris quis ea in excepteur voluptate cupidatat eu quis minim amet. In duis aliqua consectetur qui pariatur Lorem aliquip. Ullamco dolore fugiat cillum ad laborum eiusmod amet eiusmod do. Qui eiusmod minim officia proident in exercitation consectetur culpa aliquip elit tempor. Tempor ea ea laborum do et. Eiusmod cupidatat aliquip ad pariatur dolor ea ad enim ad adipisicing ea ea',
        textAlign: TextAlign.justify,
        style: textTheme.subtitle1,
        
      ),
      
    );
  }
}