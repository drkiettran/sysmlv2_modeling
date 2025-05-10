package AccessControlRequirements {
	private import Requirements::*;
	
	requirement <'AC.1'> PolicyAndProcedures: FunctionalRequirementCheck {
		requirement Roles;
		requirement Levels;
		requirement Official;
		requirement Frequency;
		requirement Events; 
		requirement <'AC.1.1'> AutomatedSystemAccountManagement: FunctionalRequirementCheck {
			/* Supports the management of system accounts */
		}
		requirement <'AC.1.2'> AutomatedTemporaryAndEmergencyAccountManagement: FunctionalRequirementCheck {
			/* Automatically remove/disable temporary and emergency accounts after */
		}
		requirement <'AC.1.3'> DisableAccounts: FunctionalRequirementCheck {
			/* Supports the management of system accounts */
			requirement AccountExpiredEvent;
		}
	}
}