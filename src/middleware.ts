import { clerkMiddleware } from '@clerk/nextjs/server';

// Configure middleware with clock skew tolerance
// This allows up to 2 minutes of clock difference to prevent JWT timing errors
export default clerkMiddleware({
  clockSkewInMs: 120000, // 2 minutes tolerance for clock skew
});

export const config = {
  matcher: [
    // Skip Next.js internals and all static files, unless found in search params
    '/((?!_next|[^?]*\\.(?:html?|css|js(?!on)|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest)).*)',
    // Always run for API routes
    '/(api|trpc)(.*)',
  ],
};
