#!/usr/bin/php
<?php
/* Report Tetra monthly cases */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');
require_once('custom/include/PHPExcel/PHPExcel.php');

/* Query database to get case aging */
$query = 'select case_number,name,status,CONVERT_TZ(date_entered,\'+00:00\',\'-06:00\') as date_entered,description,resolveddate_c,resolution from cases inner join cases_cstm on cases.id=cases_cstm.id_c where account_id="38078d8a-758f-e947-bb6e-536a7beffba8" and deleted=0 and (date_entered>=date_sub(now(),interval 31 day) or status not in ("Closed","Resolved")) order by date_entered desc;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Tetra Monthly Report');

/* Create excel sheet in memory */
$excelreport = new PHPExcel();

$excelreport->getProperties()->setCreator("Datacom LLC")
                             ->setLastModifiedBy("Reporting Service")
                             ->setTitle("Tetra Monthly Case Report")
                             ->setSubject("Tetra Monthly Case Report")
                             ->setDescription("Tetra Monthly Case Report")
                             ->setKeywords("Case,Report,Tetra")
                             ->setCategory("Report");

$excelreport->setActiveSheetIndex(0)
            ->setCellValue('A2', 'Case Number')
            ->setCellValue('B2', 'Case Name')
            ->setCellValue('C2', 'Case Status')
            ->setCellValue('D2', 'Date Entered')
            ->setCellValue('E2', 'Description')
            ->setCellValue('F2', 'Date Resolved')
            ->setCellValue('G2', 'Resolution');
                       
$excelreport->getActiveSheet()->setTitle('Tetra Monthly Case Report');

/* Create email bodies to send */
$emailbody = "Tetra Monthly Report<br /><br />Please find the monthly case report attached.";
$i=3;
while(($row = $db->fetchByAssoc($result))!= null){
	$excelreport->getActiveSheet()->setCellValue("A".$i,trim($row['case_number']))
                                ->setCellValue("B".$i,trim(str_replace(array("\r","\n",","),'',$row['name'])))
                                ->setCellValue("C".$i,trim($row['status']))
								->setCellValue("D".$i,trim($row['date_entered']))
								->setCellValue("E".$i,trim(str_replace(array("\r","\n",","),'',$row['description'])))
								->setCellValue("F".$i,trim($row['resolveddate_c']))
								->setCellValue("G".$i,trim(str_replace(array("\r","\n",","),'',$row['resolution'])));
	$i++;
};

/* Set Column Widths */
$excelreport->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$excelreport->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$excelreport->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$excelreport->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$excelreport->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$excelreport->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$excelreport->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);

/* Set Formatting on Sheet */
$excelreport->getActiveSheet()->getStyle('A1:G2')->getFont()->setBold(true);
$excelreport->getActiveSheet()->getStyle('A2:G2')->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

/* Write it out to a temp file */
$objWriter = PHPExcel_IOFactory::createWriter($excelreport, 'Excel2007');
$objWriter->save('/tmp/Tetra-Monthly-Report.xlsx');

/* Send out emails */
$emailObj = new Email();
$defaults = $emailObj->getSystemDefaultEmail();
$mail = new SugarPHPMailer();
$mail->setMailerForSystem();
$mail->From = $defaults['email'];
$mail->FromName = $defaults['name'];

$mail->ClearAllRecipients();
$mail->ClearReplyTos();
$mail->Subject = "Tetra Monthly Report Draft";
$mail->IsHTML(true);
$mail->Body=$emailbody;
$mail->AltBody=$emailbody;
$mail->AddAttachment('/tmp/Tetra-Monthly-Report.xlsx');

$mail->prepForOutbound();

$mail->AddAddress('daldridge@globalgroup.us');

$mail->Send();

/* Clean up shop */
$mail->SMTPClose();
unlink('/tmp/Tetra-Monthly-Report.xlsx');

?>
