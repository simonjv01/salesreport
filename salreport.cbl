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