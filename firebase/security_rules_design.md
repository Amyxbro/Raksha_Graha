# Security rules design

- Customer can read/write only their own profile and their permitted conversations.
- Customer-admin conversations: Main Admin, Admin 1, Admin 2 can access.
- Customer-customer conversations: Main Admin only can access; Admin 1/2 denied.
- Suggestions: Main Admin only.
- Admin management: Main Admin only.
- Customer stories/posts: author controls edit/delete; privacy enforced by backend rules.
- Kids data: parent/guardian access plus explicitly permitted backend roles only.
- Media access should use authenticated Firebase Storage rules and scoped paths.

These are design requirements; production rules must be reviewed and tested before deployment.
