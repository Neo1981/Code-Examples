	
//Code: hides Book Travel button if Attendee edits registration
//Date: Nov 7, 2014

if ($("#FormInfoPanelRow8Cell3:contains('TRAVEL INFORMATION')").length)
{              $("#FormRender_BookTravelTable").hide();    }


//Code: Override standard closed registration accept/decline message with the following generic message which is clearer to Attendees
//Written by: Nadeem Ramjan
$("#FormRender_ConfirmationInfoLabel").html("<p>Welcome to the registration form.</p> <p>If you would like to attend the event click on 'Accept', then click 'Continue' and you will be taken to the registration form.</p>  <p>If you are unable to attend, please click 'Decline' then click 'Continue'.</p>");

//Code: Remove the mandatory reasons for decline from Metron to make declining easier for the attendee
//Written by: Nadeem Ramjan
$("#FormRender_DeclineTypeList").val('99');  //Set Decline choice to "Other"
$("#FormRender_DeclineTable").hide();        ///Hide Decline choice from User

$("#FormRender_EditTypeList").val('1');  //Set Edit choice 
$("#FormRender_ActionEditTable").hide();        ///Hide Edit choice from User

$("#FormRender_CancellationTypeList").val('1');  //Set Cancel choice 
$("#FormRender_ActionCancelTable").hide();        ///Hide Cancel choice from User

//Notes for above script: FormRender_DeclineCommentsLabel: asks reasons for decline
//Notes for above script: FormRender_ActionPanel: 3 options: view, edit, or cancel registration

//Code: Adds compliance verbiage to the Enterprise/Company field on Forms
$("#FormRender_Enterprise_ReqV").html("* Please provide full legal entity name");

//Code: Override the standard exceed message with an abbreviated version below
//Written by: Nadeem Ramjan
$("[id$=RegExV]").text("* Exceeded/Incorrect Format");


//Written by: Nadeem Ramjan	
if( document.getElementById("ActionTable")!=null & document.getElementById("FormRender_FormInfoImage")!=null) 
{	$("#ActionTable").hide();    }


//Code: Overrides three of the Metron standard messages with our generic language below
//Written by: Nadeem Ramjan
if ($("#Message_MessageLabel:contains('maximum')").length)  //capacity met message
{	var ErrorMsg = "Registration for this meeting is no longer available because it has reached the maximum allowable number of registered attendees.";	}
else if ($("#Message_MessageLabel:contains('not available')").length) //site unpublished message 
{	var ErrorMsg = "Registration for this meeting has been temporarily suspended for maintenance.  Please try registering at a later time.  We apologize for any inconvenience.";		}
else if ($("#Message_MessageLabel:contains('as at')").length) //registrate closed due to date
{	var ErrorMsg = "We apologize, registration for this event has ended.";  }
else  //catch all for any other message Metron produces
{	var ErrorMsg = $("#Message_MessageLabel").text(); }

if(document.getElementById("Message_MessagePanel")!=null) {  //this moves the message panel into our Registration tab as opposed to having it appear above the template
		$("#Message_MessageLabel").css("color","red");
		$("#Message_MessageLabel").text(ErrorMsg);
		$("#Message_MessagePanel").appendTo(".MetronDiv");
}


	

//Code: Hide green check mark on the confirmation page
//Written by: Nadeem Ramjan
$("#FormRender_FormInfoImage").hide();


});  //end document ready function


//Code: Remove "reset" button from the form
//Written by: Nadeem Ramjan

function hideClearButton() {
   $("input:reset").hide(); 
}

//Code: Overrides the standard Metron decline message
//Written by: Nadeem Ramjan
function CustomClosedMessage(txt) {
	if( document.getElementById("Message_MessageLabel")!=null)	{
		$("#Message_MessageImage").hide(); //hide standard message
		$("#Message_MessageLabel").hide();
		$(txt).insertAfter("#Message_MessageLabel");
	}
}
