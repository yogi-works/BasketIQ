import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';

export const authGuard: CanActivateFn = (route, state) => {
  const router = inject(Router);
 
  // TODO: Replace with real auth check
  // ─────────────────────────────────────────────
  // import { AuthService } from '../services/auth.service';
  // const authService = inject(AuthService);
  // if (authService.isLoggedIn()) return true;
  // router.navigate(['/auth/login'], { queryParams: { returnUrl: state.url } });
  // return false;
  // ─────────────────────────────────────────────
 
  // STUB — always allows access during development
  return true;
};
