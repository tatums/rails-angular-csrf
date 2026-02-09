import { Component, OnInit } from '@angular/core';
import { PostService } from '../../services/post.service';
import { Post } from '../../models/post';

@Component({
  selector: 'app-posts-list',
  templateUrl: './posts-list.component.html',
  styleUrl: './posts-list.component.css'
})
export class PostsListComponent implements OnInit {
  posts: Post[] = [];

  constructor(private postService: PostService) {}

  ngOnInit(): void {
    this.loadPosts();
  }

  loadPosts(): void {
    this.postService.getPosts().subscribe(posts => this.posts = posts);
  }

  deletePost(id: number): void {
    if (confirm('Are you sure you want to delete this post?')) {
      this.postService.deletePost(id).subscribe(() => this.loadPosts());
    }
  }
}
