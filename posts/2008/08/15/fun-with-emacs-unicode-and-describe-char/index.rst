.. title: Fun With Emacs: Unicode and #'describe-char
.. slug: fun-with-emacs-unicode-and-describe-char
.. date: 2008-08-15 12:07:21 UTC-05:00
.. tags: emacs
.. category: computer/emacs
.. link: 
.. description: 
.. type: text


Ever use the emacs command ``describe-char``?  It's even more fun with
proper unicode lookup data!

.. code:: emacs-lisp

  ;; First, we'll bind it to a key.
  (global-set-key "\C-cD" #'describe-char)

  ;; Now we'll download it if necessary.
  (let ((udf-url "http://www.unicode.org/Public/UNIDATA/UnicodeData.txt")
	(udf-dest "~/tmp/UnicodeData.txt"))
    (if (file-readable-p udf-dest)
	;; Let describe-char know it exists.
	(setq describe-char-unicodedata-file udf-dest)
      ;; It doesn't exist, and we need to download it!
      (when (y-or-n-p (format "You need to download %s ! Do it? " udf-url))
	;; Really weird: wget -O 'file' complains that file doesn't exist.
	(let* ((cmd (format "cd ~/tmp/ && wget -O %s --progress=dot '%s'"
	                    udf-dest udf-url))
	       (buf (get-buffer-create (format " *wget '%s'*" udf-url)))
	       (proc (start-process-shell-command "wget-unicode-Data"
	                                          buf cmd)))
	  (display-buffer buf)
	  (set-process-sentinel
	   proc 
	   `(lambda (proc event)
	      (unless (string-match "^finished" event)
		(error "unexpected status '%s' getting '%s'" ,udf-url event))
	      (setq describe-char-unicodedata-file ,udf-dest)
	      (message "Try describe-char now! ☣☥☸▧◉✘✽☮⅙▧⚅☑☢☹☺♠♥♦♣♨♻⚔")))
	  (message "Downloading... check describe-char later")
	  nil))))

Once this is run and it tells you to try ``describe-char`` you can
position your cursor over one of the Unicode characters in the message
(“C-h e” to display the “*Messages*” buffer) and press “C-cD” and look
for the “Name:” line.  You'll see something like this:

:: 

	character: ♻ (299515, #o1110773, #x491fb, U+267B)
	  charset: mule-unicode-2500-33ff (Unicode characters of the range U+2500..U+33FF.)
       code point: #x23 #x7B
	   syntax: w 	which means: word
      buffer code: #x9C #xF2 #xA3 #xFB
	file code: #xE2 #x99 #xBB (encoded by coding system mule-utf-8)
	  display: terminal code #xE2 #x99 #xBB
     Unicode data:  
	     Name: BLACK UNIVERSAL RECYCLING SYMBOL
	 Category: other symbol
  Combining class: Spacing
    Bidi category: Other Neutrals
