import axiosInstance from './axiosInstance';

export const forumApi = {
  // GET /api/v1/posts?page=1&limit=10
  getPosts: async (page = 1, limit = 10) => {
    const response = await axiosInstance.get('/posts', {
      params: { page, limit }
    });
    return response.data; 
  },

  // GET /api/v1/posts/:id
  getPostDetail: async (id) => {
    const response = await axiosInstance.get(`/posts/${id}`);
    return response.data.data; 
  },

  // POST /api/v1/posts
  createPost: async (postData) => {
    const response = await axiosInstance.post('/posts', {
      prefix: "(No prefix)",
      title: postData.title,
      content: JSON.stringify([{ type: "text", value: postData.content }]), 
      summary: postData.content.substring(0, 150) + "...",
      type: "discussion",
      thumbnail_url: postData.image_urls?.[0] || "",
      image_urls: postData.image_urls || []
    });
    return response.data.data;
  },

  // POST /api/v1/posts/upload
  uploadImage: async (file) => {
    const formData = new FormData();
    formData.append('image', file);
    const response = await axiosInstance.post('/posts/upload', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    });
    return response.data; // { message: "...", url: "..." }
  },

  // POST /api/v1/posts/:id/comments
  addComment: async (postId, content) => {
    const response = await axiosInstance.post(`/posts/${postId}/comments`, { content });
    return response.data.data;
  },

  // POST /api/v1/posts/:id/likes
  likePost: async (postId) => {
    const response = await axiosInstance.post(`/posts/${postId}/likes`);
    return response.data;
  }
};