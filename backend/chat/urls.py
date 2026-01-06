from django.urls import path
from .views import ConversationList, MessageList

urlpatterns = [
    path('conversations/', ConversationList.as_view(), name='conversation-list'),
    path('conversations/<int:conversation_id>/messages/', MessageList.as_view(), name='message-list'),
]
