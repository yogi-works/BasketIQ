import { Routes } from '@angular/router';
import { authGuard } from './guards/auth.guard';

export const routes: Routes = [
  {
    path: '',
    loadComponent: () =>
      import('./home/home.component').then(m => m.HomeComponent)
  },
  {
    path: 'search',
    loadComponent: () =>
      import('./search/search.component').then(m => m.SearchComponent)
  },
  {
    path: 'compare/:productId',
    loadComponent: () =>
      import('./compare/compare.component').then(m => m.CompareComponent)
  },
  {
    path: 'category/:slug',
    loadComponent: () =>
      import('./category/category.component').then(m => m.CategoryComponent)
  },
  {
    path: 'deals',
    loadComponent: () =>
      import('./deals/deals.component').then(m => m.DealsComponent)
  },
  {
    path: 'platform/:name',
    loadComponent: () =>
      import('./platform/platform.component').then(m => m.PlatformComponent)
  },
  {
    path: 'auth',
    loadChildren: () =>
      import('./auth/auth.routes').then(m => m.authRoutes)
  },
  {
    path: 'dashboard',
    canActivate: [authGuard],
    loadComponent: () =>
      import('./dashboard/dashboard.component').then(m => m.DashboardComponent)
  },
  {
    path: 'alerts',
    canActivate: [authGuard],
    loadComponent: () =>
      import('./alerts/alerts.component').then(m => m.AlertsComponent)
  },
  {
    path: 'wishlist',
    canActivate: [authGuard],
    loadComponent: () =>
      import('./wishlist/wishlist.component').then(m => m.WishlistComponent)
  },
  {
    path: 'profile',
    canActivate: [authGuard],
    loadComponent: () =>
      import('./profile/profile.component').then(m => m.ProfileComponent)
  },
  {
    path: 'admin',
    canActivate: [authGuard],
    loadChildren: () =>
      import('./admin/admin.routes').then(m => m.adminRoutes)
  },
  {
    path: '**',
    redirectTo: ''
  }
];
