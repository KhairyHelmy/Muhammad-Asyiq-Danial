                // Get the radio buttons, the additional input box, and the submit button
                const option1 = document.getElementById('option1');
                const option2 = document.getElementById('option2');
                const additionalInputBox = document.getElementById('additionalInputBox');
                const additionalInput = document.getElementById('additionalInput');
                const submitButton = document.getElementById('submitButton');

                // Add event listeners to the radio buttons
                option1.addEventListener('change', () => {
                    // Hide the additional input box when option 1 is selected
                    additionalInputBox.style.display = 'none';
                });

                option2.addEventListener('change', () => {
                    // Show the additional input box when option 2 is selected
                    additionalInputBox.style.display = 'block';
                });

                // Add an event listener to the submit button
                submitButton.addEventListener('click', () => {
                    // Clear the text in the additional input box
                    additionalInput.value = '';
                });
