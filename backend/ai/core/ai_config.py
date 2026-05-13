import google.generativeai as genai
import os
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

api_key = os.getenv('GEMINI_KEY')

genai.configure(api_key=api_key)
shared_model = genai.GenerativeModel('gemini-2.5-flash')