(require 'url)
(require 'json)

(defun wiki-summary/make-api-query (s)
  "Given a wiki page title, generate the url for the API call
   to get the page info"
  (let ((pre "http://en.wikipedia.org/w/api.php?continue=&action=query&titles=")
        (post "&prop=extracts&exintro=&explaintext=&format=json&redirects")
        (term (replace-regexp-in-string " " "_" s)))
    (concat pre term post)))

(defun wiki-summary/extract-summary-from-response (resp)
  "Given the JSON reponse from the webpage, grab the summary as a string"
  'todo)

(defun wiki-summary/format-summary-in-buffer (summary)
  "Given a summary, stick it in the *wiki-summary* buffer and display the buffer"
  'todo)

(defun wiki-summary (s)
  "Return the wikipedia page's summary for a term"
  (interactive "s")
  (url-retrieve (wiki-summary/make-api-query s)
     (lambda (events)
       (goto-char url-http-end-of-headers)
       (let ((json-object-type 'plist)
             (json-key-type 'symbol)
             (json-array-type 'vector))
         (let ((result (json-read)))
           (message "Made it here"))))))

(provide 'wiki-summary)
