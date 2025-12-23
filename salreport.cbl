       identification division.
         program-id. salreport.
       environment division.
       configuration section.
       input-output section.
       file-control.
           select sales-file assign to 'sales.txt'
               organization is line sequential.
           select report-file assign to 'report.txt'
               organization is line sequential.
       data division.
       file section.
       fd  sales-file.
       01  sales-record.
           05  in-sales-name                pic x(20).
           05  in-sales-amount              pic 9(3)v99.
       fd  report-file.
       01  out-report-record                pic x(133).

       working-storgage section.
       01  ws-work-areas.
           05  are-there-more-records       pic x(3)  value 'yes'.
               88  more-records             value 'yes'.
               88  no-more-records          value 'no'.
           05  ws-total-sales-amount        pic 9(5)v99 value 0.
           05  ws-record-counter            pic 9(3)   value zeros.
           05  ws-page-number               pic 9(3)   value 1.
           05  ws-line-counter              pic 9(3)   value 0.
           05  ws-date                      pic x(6).
           05  ws-date-x redefines ws-date.
               10  ws-yr-date               pic 99.
               10  ws-mo-date               pic 99.
               10  ws-day-date              pic 99.
       01  hl-heading-1.
           05  filler                       pic x(16) value spaces.
           05  filler                       pic x(35)
                value 'TOTAL OF GROUPS OF FIVE RECORDS'.
           05  filler                       pic x(09) 
                value 'PAGE NO. '.
           05  hl-page-ct-out               pic zzz9.
           05  filler                       pic x(69) value spaces.
       01  dl-detail-line.
           05  filler                       pic x(10) value spaces.
           05  dl-name-out                  pic x(20).
           05  filler                       pic x(10) value spaces.