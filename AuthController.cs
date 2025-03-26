using Reddit.Things;
using Tensorflow.Exceptions;
using Microsoft.AspNetCore.Mvc;
using MemeFinder.Configuration;
using MemeFinder.Services;

[ApiController]
[Route("api/[controller")]
public class AuthController : ControllerBase
{
    [HttpGet("token")]
    public async Task<IActionResult> GetAccessToken()
    {
        string token = await AuthService.RefreshAccessToken();
        if (string.IsNullOrEmpty(token))
            return BadRequest("Unable to retrieve token. }");

        return Ok(new { accessToken = token });
    }
}
