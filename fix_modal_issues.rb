# Script to fix modal opening issues in admin subscriptions page
# This script addresses common modal problems like z-index, display, and JavaScript issues

puts "🔧 Fixing Modal Issues in Admin Subscriptions Page"
puts "=" * 50

# Check if we're in the correct directory
if File.exist?('app/views/admin/subscriptions')
  puts "✅ Found admin subscriptions views directory"
else
  puts "❌ Admin subscriptions views directory not found"
  exit 1
end

# 1. Fix modal CSS issues
modal_css_fix = <<~CSS
  /* Modal Fix - Add to application.css or admin.css */
  .modal {
    z-index: 1050 !important;
  }

  .modal-backdrop {
    z-index: 1040 !important;
  }

  .modal-dialog {
    z-index: 1060 !important;
    margin: 30px auto !important;
  }

  .modal.fade .modal-dialog {
    transform: translate(0, -50px) !important;
    transition: transform 0.3s ease-out !important;
  }

  .modal.show .modal-dialog {
    transform: translate(0, 0) !important;
  }

  /* Custom modal classes for better compatibility */
  .custom-modal {
    display: none;
    position: fixed;
    z-index: 1055;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(5px);
  }

  .custom-modal.show {
    display: flex !important;
    align-items: center;
    justify-content: center;
  }

  .custom-modal-content {
    background: white;
    border-radius: 8px;
    padding: 20px;
    max-width: 90vw;
    max-height: 90vh;
    overflow-y: auto;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    position: relative;
    animation: modalSlideIn 0.3s ease-out;
  }

  @keyframes modalSlideIn {
    from {
      transform: translateY(-50px);
      opacity: 0;
    }
    to {
      transform: translateY(0);
      opacity: 1;
    }
  }

  .modal-close-btn {
    position: absolute;
    top: 10px;
    right: 15px;
    background: none;
    border: none;
    font-size: 24px;
    cursor: pointer;
    color: #666;
  }

  .modal-close-btn:hover {
    color: #000;
  }
CSS

# 2. JavaScript fix for modal functionality
modal_js_fix = <<~JS
  // Modal Fix JavaScript - Add to application.js or admin.js
  document.addEventListener('DOMContentLoaded', function() {
    console.log('🔧 Initializing modal fixes...');

    // Fix Bootstrap modal issues
    function initializeModals() {
      // Remove any existing backdrop issues
      document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
        if (!document.querySelector('.modal.show')) {
          backdrop.remove();
        }
      });

      // Initialize all modals
      const modals = document.querySelectorAll('[data-bs-toggle="modal"]');
      modals.forEach(trigger => {
        trigger.addEventListener('click', function(e) {
          e.preventDefault();
          const targetModal = document.querySelector(this.getAttribute('data-bs-target') || this.getAttribute('href'));
          if (targetModal) {
            openModal(targetModal);
          }
        });
      });

      // Custom modal open function
      window.openModal = function(modal) {
        if (typeof modal === 'string') {
          modal = document.querySelector(modal);
        }
        if (modal) {
          modal.style.display = 'block';
          modal.classList.add('show');
          document.body.classList.add('modal-open');

          // Add backdrop if not exists
          if (!document.querySelector('.modal-backdrop')) {
            const backdrop = document.createElement('div');
            backdrop.className = 'modal-backdrop fade show';
            document.body.appendChild(backdrop);
          }
        }
      };

      // Custom modal close function
      window.closeModal = function(modal) {
        if (typeof modal === 'string') {
          modal = document.querySelector(modal);
        }
        if (modal) {
          modal.style.display = 'none';
          modal.classList.remove('show');
          document.body.classList.remove('modal-open');

          // Remove backdrop
          const backdrop = document.querySelector('.modal-backdrop');
          if (backdrop) {
            backdrop.remove();
          }
        }
      };

      // Close modal when clicking outside
      document.addEventListener('click', function(e) {
        if (e.target.classList.contains('modal')) {
          closeModal(e.target);
        }
      });

      // Close modal with escape key
      document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
          const openModal = document.querySelector('.modal.show');
          if (openModal) {
            closeModal(openModal);
          }
        }
      });

      // Fix close buttons
      document.querySelectorAll('[data-bs-dismiss="modal"], .modal-close-btn').forEach(btn => {
        btn.addEventListener('click', function() {
          const modal = this.closest('.modal');
          if (modal) {
            closeModal(modal);
          }
        });
      });
    }

    // Initialize on page load
    initializeModals();

    // Re-initialize on dynamic content load (for AJAX)
    if (typeof Turbo !== 'undefined') {
      document.addEventListener('turbo:load', initializeModals);
    }

    console.log('✅ Modal fixes initialized');
  });

  // Alternative custom modal system (if Bootstrap is problematic)
  window.showCustomModal = function(content, title = '') {
    // Remove existing modal if any
    const existingModal = document.querySelector('.custom-modal');
    if (existingModal) {
      existingModal.remove();
    }

    // Create modal
    const modal = document.createElement('div');
    modal.className = 'custom-modal';
    modal.innerHTML = `
      <div class="custom-modal-content">
        <button class="modal-close-btn" onclick="closeCustomModal()">&times;</button>
        ${title ? `<h3 style="margin-bottom: 20px;">${title}</h3>` : ''}
        ${content}
      </div>
    `;

    document.body.appendChild(modal);

    // Show modal
    setTimeout(() => modal.classList.add('show'), 10);

    return modal;
  };

  window.closeCustomModal = function() {
    const modal = document.querySelector('.custom-modal');
    if (modal) {
      modal.classList.remove('show');
      setTimeout(() => modal.remove(), 300);
    }
  };
JS

# 3. Check and create CSS file
css_file_path = 'app/assets/stylesheets/modal_fixes.css'
File.write(css_file_path, modal_css_fix)
puts "✅ Created modal CSS fixes: #{css_file_path}"

# 4. Check and create JS file
js_file_path = 'app/assets/javascripts/modal_fixes.js'
File.write(js_file_path, modal_js_fix)
puts "✅ Created modal JS fixes: #{js_file_path}"

# 5. Create a test HTML file to verify modal functionality
test_modal_html = <<~HTML
<!DOCTYPE html>
<html>
<head>
  <title>Modal Test</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>#{modal_css_fix}</style>
</head>
<body>
  <div class="container mt-5">
    <h2>Modal Test Page</h2>

    <!-- Bootstrap Modal Trigger -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#testModal">
      Open Bootstrap Modal
    </button>

    <!-- Custom Modal Trigger -->
    <button type="button" class="btn btn-success" onclick="showCustomModal('<p>This is a custom modal!</p>', 'Custom Modal')">
      Open Custom Modal
    </button>

    <!-- Bootstrap Modal -->
    <div class="modal fade" id="testModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Test Modal</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <p>This is a test modal to verify functionality.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>#{modal_js_fix}</script>
</body>
</html>
HTML

test_file_path = 'public/modal_test.html'
File.write(test_file_path, test_modal_html)
puts "✅ Created modal test page: #{test_file_path}"

puts "\n🎯 Modal Fix Instructions:"
puts "1. Add the CSS fixes to your main stylesheet"
puts "2. Add the JS fixes to your main JavaScript file"
puts "3. Test modals using: #{ENV['RAILS_ENV'] == 'production' ? 'https://fna-2.onrender.com' : 'http://localhost:3000'}/modal_test.html"
puts "4. If using Bootstrap 5, ensure data-bs-* attributes instead of data-* attributes"
puts "5. Check browser console for JavaScript errors"

puts "\n🔧 Quick Debugging Steps:"
puts "- Open browser developer tools (F12)"
puts "- Check Console tab for JavaScript errors"
puts "- Check Network tab for missing CSS/JS files"
puts "- Try the custom modal functions if Bootstrap modal fails"

puts "\n" + "=" * 50
puts "✅ Modal fix script completed!"