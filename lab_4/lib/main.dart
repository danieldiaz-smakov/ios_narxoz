import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ProfileScreen()));
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false;
  bool _isLiked = false;
  int _likes = 1156;
  int _followers = 9999;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      if (_isFollowing) {
        _followers++;
      } else {
        _followers--;
      }
    });
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _likes++;
      } else {
        _likes--;
      }
    });
  }

  void _reset() {
    setState(() {
      _isFollowing = false;
      _isLiked = false;
      _likes = 1156;
      _followers = 9999;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 50,
              child: Text('DS'),
            ),
            const SizedBox(height: 16),

            const Text('Danieldiaz Smakov'),
            const Text('Flutter Developer • Almaty'),
            const SizedBox(height: 16),

            Text('Followers: $_followers'),
            Text('Likes: $_likes'),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _toggleFollow,
              child: Text(_isFollowing ? 'Following' : 'Follow'),
            ),

            ElevatedButton(
              onPressed: _toggleLike,
              child: Text(_isLiked ? 'Unlike (-1)' : 'Like (+1)'),
            ),

            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}