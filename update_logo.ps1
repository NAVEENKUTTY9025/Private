$files = Get-ChildItem -Path . -Filter *.html

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw

    # Update .logo-icon i font-size
    $content = $content -replace '\.logo-icon i\s*\{\s*color:\s*var\(--neon-purple\);\s*font-size:\s*[^;]+;', '.logo-icon i { color: var(--neon-purple); font-size: 1.8rem;'
    
    # Update .logo-icon dimensions and border-radius
    $content = $content -replace '(\.logo-icon\s*\{[^}]+?width:\s*)[^;]+;', '${1}2.8rem;'
    $content = $content -replace '(\.logo-icon\s*\{[^}]+?height:\s*)[^;]+;', '${1}2.8rem;'
    $content = $content -replace '(\.logo-icon\s*\{[^}]+?border-radius:\s*)[^;]+;', '${1}0.9rem;'

    # Update .logo-text font-size
    $content = $content -replace '(\.logo-text\s*\{[^}]+?font-size:\s*)[^;]+;', '${1}1.45rem;'
    
    # Update .sidebar-logo-icon i font-size
    $content = $content -replace '\.sidebar-logo-icon i\s*\{\s*color:\s*var\(--neon-purple\);\s*font-size:\s*[^;]+;', '.sidebar-logo-icon i { color: var(--neon-purple); font-size: 1.8rem;'

    # Update .sidebar-logo-icon dimensions and border-radius
    $content = $content -replace '(\.sidebar-logo-icon\s*\{[^}]+?width:\s*)[^;]+;', '${1}2.8rem;'
    $content = $content -replace '(\.sidebar-logo-icon\s*\{[^}]+?height:\s*)[^;]+;', '${1}2.8rem;'
    $content = $content -replace '(\.sidebar-logo-icon\s*\{[^}]+?border-radius:\s*)[^;]+;', '${1}0.9rem;'

    # Update .sidebar-logo-text font-size
    $content = $content -replace '(\.sidebar-logo-text\s*\{[^}]+?font-size:\s*)[^;]+;', '${1}1.45rem;'

    Set-Content -Path $file.FullName -Value $content -NoNewline
}
Write-Output "Done"
