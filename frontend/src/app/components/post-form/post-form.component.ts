import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PostService } from '../../services/post.service';
import { Post } from '../../models/post';

@Component({
  selector: 'app-post-form',
  templateUrl: './post-form.component.html',
  styleUrl: './post-form.component.css'
})
export class PostFormComponent implements OnInit {
  post: Post = { title: '', body: '' };
  isEditing = false;
  postId?: number;

  constructor(
    private postService: PostService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditing = true;
      this.postId = +id;
      this.postService.getPost(this.postId).subscribe(post => this.post = post);
    }
  }

  onSubmit(): void {
    if (this.isEditing && this.postId) {
      this.postService.updatePost(this.postId, this.post).subscribe(() => {
        this.router.navigate(['/']);
      });
    } else {
      this.postService.createPost(this.post).subscribe(() => {
        this.router.navigate(['/']);
      });
    }
  }
}
