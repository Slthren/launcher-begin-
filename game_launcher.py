import tkinter as tk
from tkinter import ttk, messagebox
import webbrowser
import os
import json
import subprocess
import sys
from pathlib import Path
import time
import threading

class GameLauncher:
    def __init__(self, root):
        self.root = root
        self.root.title("🎮 لانشر الألعاب - Game Launcher")
        self.root.geometry("800x600")
        self.root.configure(bg='#1a1a2e')
        self.root.resizable(False, False)
        
        # Center window
        self.center_window()
        
        # Configuration file path
        self.stats_file = Path("launcher_stats.json")
        
        # Initialize stats
        self.stats = self.load_stats()
        
        # Create UI
        self.create_widgets()
    
    def center_window(self):
        """Center the window on screen"""
        self.root.update_idletasks()
        width = self.root.winfo_width()
        height = self.root.winfo_height()
        x = (self.root.winfo_screenwidth() // 2) - (width // 2)
        y = (self.root.winfo_screenheight() // 2) - (height // 2)
        self.root.geometry(f'{width}x{height}+{x}+{y}')
    
    def load_stats(self):
        """Load launcher statistics"""
        if self.stats_file.exists():
            try:
                with open(self.stats_file, 'r', encoding='utf-8') as f:
                    return json.load(f)
            except:
                pass
        return {
            'total_play_time': 0,
            'games_played': 0,
            'high_score': 0,
            'achievements': 0
        }
    
    def save_stats(self):
        """Save launcher statistics"""
        try:
            with open(self.stats_file, 'w', encoding='utf-8') as f:
                json.dump(self.stats, f, ensure_ascii=False, indent=2)
        except Exception as e:
            print(f"Error saving stats: {e}")
    
    def create_widgets(self):
        """Create the main UI widgets"""
        # Header frame
        header_frame = tk.Frame(self.root, bg='#16213e', height=80)
        header_frame.pack(fill=tk.X, padx=10, pady=(10, 0))
        header_frame.pack_propagate(False)
        
        # Title
        title_label = tk.Label(
            header_frame, 
            text="🎮 لانشر الألعاب",
            font=("Arial", 24, "bold"),
            fg='#ffd700',
            bg='#16213e'
        )
        title_label.pack(pady=20)
        
        # Main content frame
        content_frame = tk.Frame(self.root, bg='#1a1a2e')
        content_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        
        # Games frame
        games_frame = tk.LabelFrame(
            content_frame,
            text="الألعاب المتوفرة",
            font=("Arial", 14, "bold"),
            fg='#ffffff',
            bg='#1a1a2e',
            bd=2,
            relief=tk.RAISED
        )
        games_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        
        # Mario game button
        mario_frame = tk.Frame(games_frame, bg='#2d4a87', relief=tk.RAISED, bd=2)
        mario_frame.pack(fill=tk.X, padx=20, pady=15)
        
        mario_icon = tk.Label(
            mario_frame,
            text="🍄",
            font=("Arial", 32),
            bg='#2d4a87'
        )
        mario_icon.pack(side=tk.LEFT, padx=20, pady=10)
        
        mario_info = tk.Frame(mario_frame, bg='#2d4a87')
        mario_info.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=10)
        
        mario_title = tk.Label(
            mario_info,
            text="Super Mario Bros",
            font=("Arial", 16, "bold"),
            fg='#ffffff',
            bg='#2d4a87'
        )
        mario_title.pack(anchor=tk.W, pady=(10, 5))
        
        mario_desc = tk.Label(
            mario_info,
            text="لعبة المنصات الكلاسيكية مع ماريو! 6 مراحل، متجر، قوى خارقة",
            font=("Arial", 10),
            fg='#cccccc',
            bg='#2d4a87',
            wraplength=300
        )
        mario_desc.pack(anchor=tk.W)
        
        mario_btn = tk.Button(
            mario_frame,
            text="▶ العب الآن",
            font=("Arial", 12, "bold"),
            bg='#4caf50',
            fg='white',
            relief=tk.FLAT,
            padx=20,
            pady=10,
            command=self.launch_mario
        )
        mario_btn.pack(side=tk.RIGHT, padx=20, pady=10)
        
        # Coming soon games
        coming_games = [
            ("🏎️", "سباق السيارات", "سباقات مثيرة بسيارات سريعة"),
            ("🚀", "حرب الفضاء", "معركة ملحمية في الفضاء"),
            ("🧩", "ألغاز الذكاء", "تحديات ذهنية متنوعة")
        ]
        
        for icon, title, desc in coming_games:
            game_frame = tk.Frame(games_frame, bg='#444444', relief=tk.RAISED, bd=1)
            game_frame.pack(fill=tk.X, padx=20, pady=5)
            
            game_icon = tk.Label(
                game_frame,
                text=icon,
                font=("Arial", 20),
                bg='#444444'
            )
            game_icon.pack(side=tk.LEFT, padx=15, pady=8)
            
            game_info = tk.Frame(game_frame, bg='#444444')
            game_info.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=10)
            
            game_title = tk.Label(
                game_info,
                text=title,
                font=("Arial", 12, "bold"),
                fg='#888888',
                bg='#444444'
            )
            game_title.pack(anchor=tk.W, pady=(8, 2))
            
            game_desc = tk.Label(
                game_info,
                text=desc,
                font=("Arial", 9),
                fg='#666666',
                bg='#444444'
            )
            game_desc.pack(anchor=tk.W)
            
            coming_label = tk.Label(
                game_frame,
                text="قريباً",
                font=("Arial", 10, "bold"),
                bg='#ff5722',
                fg='white',
                padx=10,
                pady=5
            )
            coming_label.pack(side=tk.RIGHT, padx=15, pady=8)
        
        # Stats frame
        stats_frame = tk.LabelFrame(
            content_frame,
            text="📊 الإحصائيات",
            font=("Arial", 12, "bold"),
            fg='#ffffff',
            bg='#1a1a2e',
            bd=2
        )
        stats_frame.pack(fill=tk.X, padx=10, pady=(0, 10))
        
        stats_grid = tk.Frame(stats_frame, bg='#1a1a2e')
        stats_grid.pack(fill=tk.X, padx=10, pady=10)
        
        # Stats labels
        self.stats_labels = {}
        stats_info = [
            ("total_play_time", "دقائق اللعب", "#4caf50"),
            ("games_played", "الألعاب المُلعبة", "#2196f3"),
            ("high_score", "أعلى نقاط", "#ff9800"),
            ("achievements", "الإنجازات", "#9c27b0")
        ]
        
        for i, (key, label, color) in enumerate(stats_info):
            stat_frame = tk.Frame(stats_grid, bg='#2d2d2d', relief=tk.RAISED, bd=1)
            stat_frame.grid(row=0, column=i, padx=5, pady=5, sticky='ew')
            stats_grid.grid_columnconfigure(i, weight=1)
            
            value_label = tk.Label(
                stat_frame,
                text=str(self.stats[key]),
                font=("Arial", 16, "bold"),
                fg=color,
                bg='#2d2d2d'
            )
            value_label.pack(pady=(10, 5))
            
            desc_label = tk.Label(
                stat_frame,
                text=label,
                font=("Arial", 9),
                fg='#cccccc',
                bg='#2d2d2d'
            )
            desc_label.pack(pady=(0, 10))
            
            self.stats_labels[key] = value_label
        
        # Bottom buttons
        button_frame = tk.Frame(self.root, bg='#1a1a2e')
        button_frame.pack(fill=tk.X, padx=10, pady=(0, 10))
        
        settings_btn = tk.Button(
            button_frame,
            text="⚙️ الإعدادات",
            font=("Arial", 10),
            bg='#607d8b',
            fg='white',
            relief=tk.FLAT,
            padx=15,
            pady=5,
            command=self.show_settings
        )
        settings_btn.pack(side=tk.LEFT, padx=5)
        
        about_btn = tk.Button(
            button_frame,
            text="ℹ️ حول",
            font=("Arial", 10),
            bg='#795548',
            fg='white',
            relief=tk.FLAT,
            padx=15,
            pady=5,
            command=self.show_about
        )
        about_btn.pack(side=tk.LEFT, padx=5)
        
        exit_btn = tk.Button(
            button_frame,
            text="❌ خروج",
            font=("Arial", 10),
            bg='#f44336',
            fg='white',
            relief=tk.FLAT,
            padx=15,
            pady=5,
            command=self.root.quit
        )
        exit_btn.pack(side=tk.RIGHT, padx=5)
    
    def launch_mario(self):
        """Launch Super Mario game"""
        try:
            # Update stats
            self.stats['games_played'] += 1
            self.save_stats()
            self.update_stats_display()
            
            # Show launching message
            self.show_message("🍄 جاري تشغيل Super Mario Bros...")
            
            # Find mario game file
            mario_file = Path("mario_game.html")
            if not mario_file.exists():
                self.show_error("❌ لم يتم العثور على ملف اللعبة mario_game.html")
                return
            
            # Launch in browser
            mario_path = mario_file.absolute().as_uri()
            webbrowser.open(mario_path)
            
        except Exception as e:
            self.show_error(f"❌ خطأ في تشغيل اللعبة: {str(e)}")
    
    def update_stats_display(self):
        """Update statistics display"""
        for key, label in self.stats_labels.items():
            label.config(text=str(self.stats[key]))
    
    def show_settings(self):
        """Show settings dialog"""
        settings_window = tk.Toplevel(self.root)
        settings_window.title("⚙️ الإعدادات")
        settings_window.geometry("400x300")
        settings_window.configure(bg='#1a1a2e')
        settings_window.resizable(False, False)
        
        # Center settings window
        settings_window.transient(self.root)
        settings_window.grab_set()
        
        # Settings content
        tk.Label(
            settings_window,
            text="⚙️ إعدادات اللانشر",
            font=("Arial", 16, "bold"),
            fg='#ffd700',
            bg='#1a1a2e'
        ).pack(pady=20)
        
        # Stats info
        stats_frame = tk.LabelFrame(
            settings_window,
            text="الإحصائيات الحالية",
            font=("Arial", 12, "bold"),
            fg='#ffffff',
            bg='#1a1a2e'
        )
        stats_frame.pack(fill=tk.X, padx=20, pady=10)
        
        for key, value in self.stats.items():
            tk.Label(
                stats_frame,
                text=f"{key}: {value}",
                font=("Arial", 10),
                fg='#cccccc',
                bg='#1a1a2e'
            ).pack(anchor=tk.W, padx=10, pady=2)
        
        # Reset button
        reset_btn = tk.Button(
            settings_window,
            text="🔄 مسح الإحصائيات",
            font=("Arial", 12),
            bg='#ff5722',
            fg='white',
            relief=tk.FLAT,
            padx=20,
            pady=10,
            command=lambda: self.reset_stats(settings_window)
        )
        reset_btn.pack(pady=20)
        
        # Close button
        tk.Button(
            settings_window,
            text="إغلاق",
            font=("Arial", 12),
            bg='#607d8b',
            fg='white',
            relief=tk.FLAT,
            padx=20,
            pady=5,
            command=settings_window.destroy
        ).pack(pady=10)
    
    def reset_stats(self, window):
        """Reset statistics"""
        if messagebox.askyesno("تأكيد", "هل تريد مسح جميع الإحصائيات؟"):
            self.stats = {
                'total_play_time': 0,
                'games_played': 0,
                'high_score': 0,
                'achievements': 0
            }
            self.save_stats()
            self.update_stats_display()
            window.destroy()
            self.show_message("🔄 تم مسح الإحصائيات بنجاح")
    
    def show_about(self):
        """Show about dialog"""
        about_text = """🎮 لانشر الألعاب
الإصدار 1.0

تم التطوير بواسطة Cascade AI

الألعاب المتوفرة:
✅ Super Mario Bros - متوفر
⏳ سباق السيارات - قريباً
⏳ حرب الفضاء - قريباً
⏳ ألغاز الذكاء - قريباً

© 2024 جميع الحقوق محفوظة"""
        
        messagebox.showinfo("حول اللانشر", about_text)
    
    def show_message(self, message):
        """Show info message"""
        messagebox.showinfo("لانشر الألعاب", message)
    
    def show_error(self, message):
        """Show error message"""
        messagebox.showerror("خطأ", message)

def main():
    """Main function"""
    root = tk.Tk()
    
    # Set window icon (if available)
    try:
        root.iconbitmap('icon.ico')
    except:
        pass
    
    app = GameLauncher(root)
    root.mainloop()

if __name__ == "__main__":
    main()
