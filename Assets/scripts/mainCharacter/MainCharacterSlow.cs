using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainCharacterSlow : MonoBehaviour
{
    private MainCharacterController _mainCharacterController;
    private bool isSlowed = false; 

    private void Start()
    {
        _mainCharacterController = GetComponent<MainCharacterController>();
        if (_mainCharacterController == null)
        {
            Debug.LogError("MainCharacterController bileþeni bulunamadý!");
        }
    }

    public void ApplySlowEffect(float slowMultiplier, float duration)
    {
        if (isSlowed) return; 

        if (_mainCharacterController != null)
        {
            isSlowed = true; 
            float originalMagnitude = _mainCharacterController.runVectorMagnitude;

            
            _mainCharacterController.runVectorMagnitude *= slowMultiplier;

           
            StartCoroutine(ResetRunVectorMagnitudeAfterDelay(originalMagnitude, duration));
        }
    }

    private IEnumerator ResetRunVectorMagnitudeAfterDelay(float originalMagnitude, float delay)
    {
        yield return new WaitForSeconds(delay);

        if (_mainCharacterController != null)
        {
            _mainCharacterController.runVectorMagnitude = originalMagnitude;
        }

        isSlowed = false; 
    }
}
