import { Routes } from '@angular/router';
import { PostsListComponent } from './components/posts-list/posts-list.component';
import { PostFormComponent } from './components/post-form/post-form.component';

export const routes: Routes = [
  { path: '', component: PostsListComponent },
  { path: 'posts/new', component: PostFormComponent },
  { path: 'posts/:id/edit', component: PostFormComponent },
];
