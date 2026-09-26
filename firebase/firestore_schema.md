# Firestore schema (planned V1/V2)

users/{userId}: name, username, phone, email, dob, birthTime, birthPlace, currentLocation, language, photoUrl, privacy, createdAt, updatedAt, status
admins/{adminId}: role, permissions, active, createdAt
conversations/{conversationId}: type(customer_admin|customer_customer|admin_admin), participants, createdAt, updatedAt
messages/{messageId}: conversationId, senderId, type(text|image|voice|file), text, mediaUrl, createdAt, deliveredAt, readAt
posts/{postId}: authorId, text, mediaUrls, privacy, createdAt, updatedAt
customer_stories/{storyId}: authorId, mediaUrls, privacy, createdAt, expiresAt
 daily_content/{contentId}: date, sections, nepali, english, enabled
festival_banners/{bannerId}: nepali, english, imageUrl, startAt, endAt, enabled, notificationEnabled
horoscopes/{horoscopeId}: date, sign, nepali, english, enabled
notifications/{notificationId}: title, nepali, english, target, scheduledAt, sentAt
suggestions/{suggestionId}: userId, text, mediaUrls, createdAt, status
calls/{callId}: callerId, receiverId, conversationId, callType, status, startedAt, endedAt
kids_profiles/{kidId}: parentId, nickname, controls, createdAt
quizzes/{quizId}: category, difficulty, questions, language, enabled
