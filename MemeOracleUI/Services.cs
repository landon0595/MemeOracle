using MemeFinder.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MemeOracleUI.Utility
{
    internal class Services
    {
        public async Task<IActionResult> RefreshAccessTokenWrapper()
        {
            try
            {
                string token = await AuthService.RefreshAccessToken();
                if (string.IsNullOrEmpty(token))
                {
                    return new BadRequestObjectResult("Unable to retrieve token.");
                }

                return new OkObjectResult(new { accessToken = token });
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Exception retrieving token: {ex.Message}");
                return new BadRequestObjectResult("An error occurred while retrieving the token.");
            }
        }
    }
}
