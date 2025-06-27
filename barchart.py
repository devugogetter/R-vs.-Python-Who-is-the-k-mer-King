import matplotlib.pyplot as plt

# Data
languages = ['R', 'Python']
median_times = [33.85, 21.90]

# Create an attractive bar chart
fig, ax = plt.subplots()
bars = ax.bar(languages, median_times)

# Labels and title with enhanced font sizes
ax.set_ylabel('Median Runtime (ms)', fontsize=12, fontweight='bold')
ax.set_xlabel('Language', fontsize=12, fontweight='bold')
ax.set_title('R vs. Python 4-mer Counting Runtime', fontsize=14, fontweight='bold')

# Add gridlines for readability
ax.grid(axis='y', linestyle='--', linewidth=0.7, alpha=0.7)

# Annotate each bar with its value
for bar in bars:
    height = bar.get_height()
    ax.annotate(f'{height:.2f}',
                xy=(bar.get_x() + bar.get_width() / 2, height),
                xytext=(0, 3),  # offset text by 3 points vertically
                textcoords="offset points",
                ha='center', va='bottom', fontsize=10)

plt.tight_layout()
plt.show()
