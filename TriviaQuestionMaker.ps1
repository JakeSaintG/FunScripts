Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#region create prompt box
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,400)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,320)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,320)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)
#endregion

#region question textbox
$questionLabel = New-Object System.Windows.Forms.Label
$questionLabel.Location = New-Object System.Drawing.Point(10,20)
$questionLabel.Size = New-Object System.Drawing.Size(280,20)
$questionLabel.Text = 'Question:'
$form.Controls.Add($questionLabel)

$question = New-Object System.Windows.Forms.TextBox
$question.Location = New-Object System.Drawing.Point(10,40)
$question.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($question)
#endregion

#region option 1 textbox
$option1Label = New-Object System.Windows.Forms.Label
$option1Label.Location = New-Object System.Drawing.Point(10,90)
$option1Label.Size = New-Object System.Drawing.Size(280,20)
$option1Label.Text = 'Option 1:'
$form.Controls.Add($option1Label)

$option1 = New-Object System.Windows.Forms.TextBox
$option1.Location = New-Object System.Drawing.Point(10,110)
$option1.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($option1)
#endregion

#region option 2 textbox
$option2Label = New-Object System.Windows.Forms.Label
$option2Label.Location = New-Object System.Drawing.Point(10,140)
$option2Label.Size = New-Object System.Drawing.Size(280,20)
$option2Label.Text = 'Option 2:'
$form.Controls.Add($option2Label)

$option2 = New-Object System.Windows.Forms.TextBox
$option2.Location = New-Object System.Drawing.Point(10,160)
$option2.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($option2)
#endregion

#region option 3 textbox
$option3Label = New-Object System.Windows.Forms.Label
$option3Label.Location = New-Object System.Drawing.Point(10,190)
$option3Label.Size = New-Object System.Drawing.Size(280,20)
$option3Label.Text = 'Option 3:'
$form.Controls.Add($option3Label)

$option3 = New-Object System.Windows.Forms.TextBox
$option3.Location = New-Object System.Drawing.Point(10,210)
$option3.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($option3)
#endregion

#region option 4 textbox
$option4Label = New-Object System.Windows.Forms.Label
$option4Label.Location = New-Object System.Drawing.Point(10,240)
$option4Label.Size = New-Object System.Drawing.Size(280,20)
$option4Label.Text = 'Option 4:'
$form.Controls.Add($option4Label)

$option4 = New-Object System.Windows.Forms.TextBox
$option4.Location = New-Object System.Drawing.Point(10,260)
$option4.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($option4)
#endregion

$form.Topmost = $true

$result = $form.ShowDialog()

if (-not($result -eq [System.Windows.Forms.DialogResult]::OK)) {
    return;
}

Write-Host "Shuffling options and creating markdown trivia question text!";
Write-Host "=============================================================`r`n";

$questionInput = $question.Text
$options = @($option1.Text, $option2.Text, $option3.Text, $option4.Text)
$options = $options | Sort-Object {Get-Random};

$markdown = "*$($question.Text)*`r`n";

$optionLetters = @("A","B","C","D");
$optionsCounter = 0;
$options | ForEach-Object {
    $markdown += "  $($optionLetters[$optionsCounter]). $($_)`r`n"
    $optionsCounter++;
}

$markdown;
